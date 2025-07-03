# Sidekiq configuration for both client and server

redis_config = {
  url: ENV.fetch("REDIS_URL", "redis://localhost:6379/0"),
  network_timeout: 5
}

Sidekiq.configure_server do |config|
  config.redis = redis_config

  # Configure Active Job to use Sidekiq
  config.on(:startup) do
    ActiveJob::Base.queue_adapter = :sidekiq
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

# Configure Active Job to use Sidekiq
Rails.application.config.active_job.queue_adapter = :sidekiq