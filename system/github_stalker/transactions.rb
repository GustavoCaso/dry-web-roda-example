require "dry-configurable"
require "dry-transaction"
require "github_stalker/container"

module GithubStalker
  class Transactions
    extend Dry::Configurable

    attr_reader :options

    setting :container, GithubStalker::Container
    setting :options, {}

    def self.define(&block)
      yield(new(options))
    end

    def self.options
      {container: config.container}.merge(config.options)
    end

    def initialize(options)
      @options = options
    end

    def container
      options[:container]
    end

    def define(name, &block)
      container.register(name, Dry.Transaction(options, &block))
    end
  end
end
