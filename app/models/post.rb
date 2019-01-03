class Post < ApplicationRecord
  validates :content,{presence: true,length:{maximum: 140}}
  validates :user_id,{presence: true}
 
  def user
    return  User.find_by(id: self.user_id)
  end

  
  def like_count
  return   Like.where(post_id: self.id).count
end
end
