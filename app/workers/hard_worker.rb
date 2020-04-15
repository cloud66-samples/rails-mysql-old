class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    message = "Doing some hard work with name #{name} and count #{count}"
    Rails.logger.info(message)
    puts(message)
  end
end
