class PostImage < ApplicationRecord
  has_one_attached :image #PostImage モデルには、ActiveStorage を使って画像を持たせる
  belongs_to :user #ユーザーに属する
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
  #shop_nameが存在しているかを確認するバリデーション
  #imageが存在しているかを確認するバリデーション
  
 def get_image #特定の処理で名前を呼び出せるメソッド 
   unless image.attached?
    file_path = Rails.root.join('no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image
 end
 
# いいね機能2-19
 def favorited_by?(user)
    favorites.exists?(user_id: user.id)
 end
 
end
