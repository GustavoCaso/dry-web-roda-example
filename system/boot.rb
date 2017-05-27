require "byebug" if ENV["RACK_ENV"] == "development"
require "pry" if ENV["RACK_ENV"] == "development"

require_relative "github_stalker/container"

GithubStalker::Container.finalize!

require "github_stalker/application"

require "github_stalker/transactions"

GithubStalker::Container.require "transactions/**/*.rb"
