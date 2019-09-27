#!/usr/bin/env ruby

require "date"

current_time = DateTime.now
end_time = current_time + ((11.0 / 60.0) / 24.0) # 11 minutes
while current_time < end_time
  File.open("/tmp/asset-compilation", "a") { |f| f.write("#{current_time}: performing a long asset compilation\n") }
  # puts "#{current_time}: performing a long asset compilation"
  sleep(1)
  current_time = DateTime.now
end
