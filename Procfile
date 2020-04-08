worker: bundle exec rake test:work
scheduler: bundle exec rake test:work
custom_web: TESTING_INLINE_ENV_BEFORE=custom_web bundle exec unicorn_rails -c config/unicorn.rb -E ${RAILS_ENV:-production}
web: TESTING_INLINE_ENV_BEFORE=web bundle exec unicorn_rails -c config/unicorn.rb -E ${RAILS_ENV:-production}
