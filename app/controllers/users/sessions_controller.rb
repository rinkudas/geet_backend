class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |user|
      data = {
        token:      user.authentication_token,
        user_email: user.email
      }
      render json: data, status: 201 and return
    end
  end
end
