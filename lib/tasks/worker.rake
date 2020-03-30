namespace :test do
  task :work => :environment do
    loop do
  	  puts "I'm working"
  	  sleep(5)
  	end
  end
end
