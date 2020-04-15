hard_worker: bundle exec sidekiq
worker: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
scheduler: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
custom_web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec unicorn_rails -c config/unicorn.rb -E ${RAILS_ENV:-production}
web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec unicorn_rails -c config/unicorn.rb -E ${RAILS_ENV:-production}
