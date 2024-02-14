class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていて
    # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納している
    @post_image.user_id = current_user.id
    # ser_idは画像投稿を行う際に、「どのユーザーが投稿したのか」を「ユーザーの ID で判断する」カラム
    # current_user は、コードに記述するだけで、ログイン中のユーザーの情報を取得できる便利な記述
    @post_image.save
    redirect_to post_images_path
  end
  def index
  end

  def show
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end

# post_image_paramsメソッドでは、フォームで入力されたデータが、
# 投稿データとして許可されているパラメータかどうかをチェックしています。