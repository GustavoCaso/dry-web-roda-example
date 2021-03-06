require "dry/web/settings"
require "dry-types"

module GithubStalker
  class Settings < Dry::Web::Settings
    module Types
      include Dry::Types.module

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :database_url, Types::Required::String
    setting :session_secret, Types::Required::String
  end
end
