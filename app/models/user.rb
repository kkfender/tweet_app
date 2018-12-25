class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,{presence: true}                  #  存在性
  validates :password, length: { minimum: 8 }       # 「8文字のみ」
 
  
 
  def posts
   return  Post.where(user_id: self.id)
  end  
end
