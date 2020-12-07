def prepend_handler(signal, &handler)
	previous = Signal.trap(signal) do
		previous = -> { raise SignalException, signal} unless previous.respond_to?(:call)
		handler.call(previous)
	end
end

prepend_handler("INT") do |old|
	puts "[PID: #{Process.pid}] [PNAME: #{$0}] Captured INT signal, ignoring"
end

prepend_handler("TERM") do |old|
	puts "[PID: #{Process.pid}] [PNAME: #{$0}] Captured TERM signal, propagating"
	old.call
end
