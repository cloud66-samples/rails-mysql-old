hard_worker: bundle exec sidekiq
worker: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
scheduler: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
custom_web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec puma -e ${RAILS_ENV:-production}
web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec puma -e ${RAILS_ENV:-production}
