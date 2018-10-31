class GreetingsController < ApplicationController
  
  caches_page :hello

  def hello
    Rails.cache.write("test", DateTime.now.to_i.to_s)

  	@message = "I'm a Rails #{ Rails::VERSION::STRING } Application"

  	ball = Ball.create(:dimples => Random.rand(1000))
  	@balls = "Created a golf ball with #{ball.dimples} dimples! - remote_ip :#{request.remote_ip}"

	@balls = @balls + "</br>"

	self.request.headers.each do |header|
		@balls = @balls + "#{header[0]}: #{header[1]} </br>"
	end
	@balls = @balls + "</br>"

	@rails_stack_path = ENV['RAILS_STACK_PATH']
  end

  def show
  	@ball = Ball.first  	

  	@rails_stack_path = ENV['RAILS_STACK_PATH']
  end
end
