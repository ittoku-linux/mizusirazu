class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(@user, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out')
  end
end
