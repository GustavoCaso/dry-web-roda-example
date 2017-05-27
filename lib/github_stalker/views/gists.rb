require "github_stalker/view_controller"

module GithubStalker
  module Views
    class Gists < GithubStalker::ViewController
      configure do |config|
        config.template = "gists"
      end

      def locals(options = {})
        super.merge(
          gists: options[:gists]
        )
      end
    end
  end
end
