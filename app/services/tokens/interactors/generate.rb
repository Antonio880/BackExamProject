# frozen_string_literal: true
module Tokens
  module Interactors
    class Generate
      include Interactor

      delegate :user, to: :context

      def call
        generate_token
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def generate_token
        context.token = JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'])
      end
    end
  end
end