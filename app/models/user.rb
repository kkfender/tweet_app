class User < ActiveRecord::Base
   mount_uploader :img, ImgUploader

  has_secure_password
  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能
  attr_accessor :image
  has_many :posts,dependent: :destroy
  has_many :returns,dependent: :destroy
  has_many :likes, dependent: :destroy
  acts_as_tagger
  acts_as_taggable # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :labels # post.label_list が追加される
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,presence: true, length: { maximum: 8 }               #  存在性
  validates :profile,length: { maximum: 80 } 

  def posts
    return  Post.where(user_id: self.id)
  end  
end
