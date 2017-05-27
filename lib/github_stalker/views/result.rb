require "github_stalker/view_controller"

module GithubStalker
  module Views
    class Result < GithubStalker::ViewController
      configure do |config|
        config.template = "result"
      end

      def locals(options = {})
        super.merge(
          login: options[:info]["login"],
          avatar_url: options[:info]["avatar_url"],
          public_profile: options[:info]["html_url"],
          name: options[:info]["name"],
          blog?: !options[:info]["blog"].nil?,
          blog: options[:info]["blog"],
        )
      end
    end
  end
end
