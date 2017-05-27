require "github_stalker/import"

module GithubStalker
  module Github
    class FetchInfo
      include GithubStalker::Import['github.client']

      def call(input)
        client.user_info(input)
      end
    end
  end
end
