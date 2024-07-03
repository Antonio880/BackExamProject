# frozen_string_literal: true
module Users
  module Interactors
    class Login
      include Interactor

      delegate :user_params, to: :context

      def call
        authenticate_user
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def user
        @user ||= User.find_by(email: user_params[:email]) || raise('Usuário não encontrado')
      end

      def authenticate_user
        if user.authenticate(user_params[:password])
          context.user = user
        else
          raise 'Senha inválida'
        end
      end
    end
  end
end