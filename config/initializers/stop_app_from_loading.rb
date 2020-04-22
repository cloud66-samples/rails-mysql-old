Rails.logger.info("$0 is #{$0} for PID #{$$}")
raise "STOPPING APP FROM LOADING" if $0.include?("puma")
