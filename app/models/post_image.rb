class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  
 def get_image #特定の処理で名前を呼び出せるメソッド 
   unless image.attached?
    file_path = Rails.root.join('assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   
 end
 
end
