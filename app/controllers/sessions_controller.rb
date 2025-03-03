class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to session[:target_path] || root_path
    else
      flash.now[:alert] = 'Verify you email and password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_path
  end
end
