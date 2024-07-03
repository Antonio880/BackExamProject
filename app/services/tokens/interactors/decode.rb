# frozen_string_literal: true
module Tokens
  module Interactors
    class Decode
      include Interactor

      delegate :token, to: :context

      def call
        decode_token
      rescue StandardError
        context.fail!(message: "Token inválido")
      end

      private

      def decode_token
        context.user_id = JWT.decode(token, ENV['JWT_SECRET'])[0]['user_id']
      end
    end
  end
end