require 'httparty'

module GithubStalker
  module Github
    class Client
      def user_info(username)
        HTTParty.get("https://api.github.com/users/#{username}").parsed_response
      end

      def gists(username)
        HTTParty.get("https://api.github.com/users/#{username}/gists").parsed_response
      end
    end
  end
end
