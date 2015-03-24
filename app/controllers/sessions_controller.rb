class SessionsController < Devise::SessionsController
  skip_before_filter :configure_permitted_parameters!
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          user_id: user.id,
          user_first_name: user.first_name,
          user_last_name: user.last_name
        }
        render json: data, status: 201 and return
      end
    end
  end
end
