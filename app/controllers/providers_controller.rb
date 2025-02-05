class ProvidersController < ApplicationController
  before_action :set_find_or_create_provider_user, only: %i[create]

  def create
    log_in @user
    flash[:notice] = "Successfully, User was authentication from #{@user.provider.provider}"
    redirect_to root_path()
  end

  def failure
    flash[:alert] = 'User authentication is failed'
    redirect_to root_path()
  end

  private
    def set_find_or_create_provider_user
      @user = Provider.find_or_create_from_auth(request.env['omniauth.auth'])
    end
end
