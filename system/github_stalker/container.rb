require "dry/web/umbrella"
require_relative "settings"

module GithubStalker
  class Container < Dry::Web::Umbrella
    configure do
      config.name = :github_stalker
      config.default_namespace = "github_stalker"
      config.settings_loader = GithubStalker::Settings
      config.listeners = true

      config.auto_register = %w[
        lib/github_stalker
      ]
    end

    load_paths! "lib", "system"

    def self.settings
      config.settings
    end
  end
end
