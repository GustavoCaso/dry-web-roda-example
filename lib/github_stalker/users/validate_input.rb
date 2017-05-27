require "dry/monads"
require "dry/matcher"
require "dry/matcher/either_matcher"

module GithubStalker
  module Users
    class ValidateInput
      Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)

      def call(input)
        if input.match(/^[\w0-9_]*$/)
          Dry::Monads::Right(input)
        else
          Dry::Monads::Left("Invalid username: #{input}")
        end
      end
    end
  end
end
