require "github_stalker/view_controller"

module GithubStalker
  module Views
    class Start < GithubStalker::ViewController
      configure do |config|
        config.template = "start"
      end
    end
  end
end
