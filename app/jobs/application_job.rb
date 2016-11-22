class ApplicationJob < ActiveJob::Base
  def perform
    puts 'hello'
  end
end
