class UsersController < ApplicationController
  def new
  end
  
  def show
    #　ユーザーの情報を取得
    #　viewファイルにその情報を送信
    @user = User.find_by(id: params[:id])
  end
end
