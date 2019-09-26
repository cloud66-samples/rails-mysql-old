#!/usr/bin/env ruby

require "date"

current_time = DateTime.now
end_time = current_time + 11.minutes
while current_time < end_time
  puts "#{current_time}: performing a long asset compilation"
  sleep(1)
  current_time = DateTime.now
end
