class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      #認証成功の場合
      redirect_to_stored_url(user)
    else
      #認証失敗の場合
      render "new"
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
end
