# frozen_string_literal: true

class SessionsController < ApplicationController
  def register
    result = Users::Organizers::Register.call(user_params: user_params_register)
    if result.success?
      render json: { token: result.token, user: result.user }, status: :created
    else
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  def login
    result = Users::Organizers::Login.call(user_params: user_params)
    if result.success?
      render json: { token: result.token, user: result.user }, status: :ok
    else
      render json: { error: result.message }, status: :unauthorized
    end
  end

  private 

    def user_params_register
      params.require(:user).permit(:username, :email, :password, :role)
    end
    
    def user_params
      params.require(:user).permit(:email, :password)
    end
    
end
