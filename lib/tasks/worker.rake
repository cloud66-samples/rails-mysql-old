namespace :test do
	task :work => :environment do
		def prepend_handler(signal, &handler)
			previous = Signal.trap(signal) do
				previous = -> { raise SignalException, signal } unless previous.respond_to?(:call)
				handler.call(previous)
			end
		end
		Signal.list.each do |signal, signal_number|
			next if signal == "ILL"
			next if signal == "FPE"
			next if signal == "BUS"
			next if signal == "SEGV"
			next if signal == "VTALRM"
			prepend_handler(signal) do |old|
				Thread.new do
					message = "Caught the following signal: #{signal}"
					Rails.logger.info(message)
					puts(message)
				end.join
				old.call
			end
		end

		loop do
			message = "I'm working"
			Rails.logger.info(message)
			puts(message)
			sleep(5)
		end
	end
end
