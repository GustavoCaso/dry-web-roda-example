require "github_stalker/view_controller"

module GithubStalker
  module Views
    class Error < GithubStalker::ViewController
      configure do |config|
        config.template = "error"
      end

      def locals(options = {})
        super.merge(
          error: options[:error]
        )
      end
    end
  end
end
