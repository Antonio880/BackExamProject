class ApplicationController < ActionController::API
  def authenticate_request!
    if token?
      result = Users::Organizers::Verify.call(token: token)
      if result.success?
        @current_user = result.user
      else
        render json: { errors: result.message }, status: :unauthorized
      end
    else
      render json: { errors: 'Token não informado' }, status: :unauthorized 
    end
  end

  private

  def token?
    request.headers['Authorization'].present?
  end

  def token
    @token ||= request.headers['Authorization'].split(' ').last
  end
end
