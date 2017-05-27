require "rom-repository"
require "github_stalker/container"
require "github_stalker/import"

GithubStalker::Container.boot! :rom

module GithubStalker
  class Repository < ROM::Repository::Root
    include GithubStalker::Import.args["persistence.rom"]
  end
end
