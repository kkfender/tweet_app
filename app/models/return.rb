class Return < ApplicationRecord
   validates :returncontent,{presence: true,length:{maximum: 8}}
  belongs_to :post
  def user
    return  User.find_by(id: self.user_id)
  end
  
  def posts
    return  Post.find_by(user_id: self.id)
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
