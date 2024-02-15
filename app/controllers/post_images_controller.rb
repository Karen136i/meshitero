class PostImagesController < ApplicationController

  def new #(投稿を作成する画面)
    @post_image = PostImage.new
  end

  def create #(投稿データを保存する画面)
    @post_image = PostImage.new(post_image_params)
    # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていて
    # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納している
    @post_image.user_id = current_user.id
    # ser_idは画像投稿を行う際に、「どのユーザーが投稿したのか」を「ユーザーの ID で判断する」カラム
    # current_user は、コードに記述するだけで、ログイン中のユーザーの情報を取得できる便利な記述
    @post_image.save

    redirect_to post_images_path
  end

  def index #(投稿一覧画面)
    @post_images = PostImage.all

  end

  def show #(投稿詳細画面)
    @post_image = PostImage.find(params[:id])
  end

  def destroy #(削除機能)
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to '/post_images'
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end

# post_image_paramsメソッドでは、フォームで入力されたデータが、
# 投稿データとして許可されているパラメータかどうかをチェックしています。