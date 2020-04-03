def prepend_handler(signal, &handler)
	previous = Signal.trap(signal) do
		previous = -> { raise SignalException, signal } unless previous.respond_to?(:call)
		handler.call(previous)
	end
end

def log_from_signal_handler(message)
	Thread.new do
		Rails.logger.info(message)
		puts(message)
	end.join
end

Signal.list.each do |signal, signal_number|
	next if signal == "ILL"
	next if signal == "FPE"
	next if signal == "BUS"
	next if signal == "SEGV"
	next if signal == "VTALRM"
	next if signal == "KILL"
	next if signal == "STOP"
	next if signal == "EXIT"
	prepend_handler(signal) do |old|
		log_from_signal_handler("Caught the following signal: #{signal}")

		signals_without_sleep = []
		if signals_without_sleep.include?(signal)
			log_from_signal_handler("Skipping sleep for SIG#{signal}")
		else
			sleep_seconds = 2

			log_from_signal_handler("Sleeping for #{sleep_seconds} seconds")
			sleep(sleep_seconds)
		end

		signals_to_ignore = []
		if signals_to_ignore.include?(signal)
			log_from_signal_handler("Ignoring SIG#{signal}")
		else
			log_from_signal_handler("Calling SIG#{signal}")
			old.call
		end
	end
end
