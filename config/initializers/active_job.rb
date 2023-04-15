Rails.application.config.active_job.queue_adapter = :sidekiq

require 'sidekiq'
require 'sidekiq-scheduler'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"], network_timeout: 5  }

  config.on(:startup) do
    puts "Starting jobs ..."

    SidekiqScheduler::Scheduler.instance.rufus_scheduler_options = { max_work_threads: 1 }
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end

  config.on(:quiet) do
    puts "Waiting for jobs ..."
  end

  config.on(:shutdown) do
    puts "Stopping jobs ..."
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_URL"], network_timeout: 5  }
end

# Sidekiq::Web.set :sessions, false