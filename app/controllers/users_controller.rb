class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し
    # @post_imagesに渡す という処理を行うことができる
  end
  
  def update
    @user = User.find(params[:id])  #1-5章
    @user.update(user_params)
    redirect_to user_path(user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
end
  
  
private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
