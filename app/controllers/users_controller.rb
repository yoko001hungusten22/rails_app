class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #登録成功時の処理
      flash[:success] = '登録に成功しました'
      redirect_to @user
    else
      flash.now[:danger] = '登録に失敗しました'
      render "new"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end