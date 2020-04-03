namespace :test do
	task :work => :environment do
		loop do
			message = "I'm working"
			Rails.logger.info(message)
			puts(message)
			sleep(5)
		end
	end
end
