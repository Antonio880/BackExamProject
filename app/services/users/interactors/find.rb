# frozen_string_literal: true
module Users
  module Interactors
    class Find
      include Interactor

      delegate :user_id, to: :context

      def call
        find_user
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private 

      def find_user
        if user = User.find_by(id: user_id)
          context.user = user
        else
          raise "Usuário não encontrado"
        end
      end
    end
  end
end
