# frozen_string_literal: true
module Users
  module Interactors
    class Create
      include Interactor

      delegate :user_params, to: :context

      def call
        create_user
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def create_user
        context.user = User.create!(user_params)
      end
    end
  end
end