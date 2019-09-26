task :before_assets_precompile do
  current_time = DateTime.now
  end_time = current_time + 11.minutes
  while current_time < end_time
    puts "#{current_time}: performing a long asset compilation"
    sleep(1)
    current_time = DateTime.now
  end
end

# every time you execute 'rake assets:precompile'
# run 'before_assets_precompile' first    
Rake::Task['assets:precompile'].enhance(['before_assets_precompile'])
