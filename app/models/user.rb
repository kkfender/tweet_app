class User < ActiveRecord::Base
   mount_uploader :img, ImgUploader

  has_secure_password
  
  
  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能
  
 

attr_accessor :image

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,{presence: true}                  #  存在性
#  validates :password, length: { minimum: 8 }       # 「8文字のみ」
#  validates :password, confirmation: true
  
  def posts
    return  Post.where(user_id: self.id)
  end  
end
