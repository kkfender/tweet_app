class Post < ApplicationRecord
  validates :content,{presence: true,length:{maximum: 140}}
  validates :user_id,{presence: true}
 mount_uploader :postimage, PostimageUploader
 belongs_to :user
 
  def user
    return  User.find_by(id: self.user_id)
  end

  
  def like_count
    return   Like.where(post_id: self.id).count
  end

  def self.search(search)
    if search
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
