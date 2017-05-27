require "github_stalker/view_controller"

module GithubStalker
  module Views
    class Welcome < GithubStalker::ViewController
      configure do |config|
        config.template = "welcome"
      end
    end
  end
end
