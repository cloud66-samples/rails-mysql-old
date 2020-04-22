hard_worker: bundle exec sidekiq -c $SIDEKIQ_CONCURRENCY
worker: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
scheduler: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec rake test:work
custom_web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec puma -e ${RAILS_ENV:-production} -d
web: A=$RAILS_ENV B=${RAILS_ENV} C=${RAILS_ENV:-test} bundle exec puma -e ${RAILS_ENV:-production}
