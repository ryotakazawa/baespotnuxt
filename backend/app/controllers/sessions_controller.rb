class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    super { @token = current_token }
  end
  
  def show
  end
  
  private
  
  def current_token
    request.env['warden-jwt_auth.token']
  end
end