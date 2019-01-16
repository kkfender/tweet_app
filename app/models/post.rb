class Post < ApplicationRecord
  validates :content,{presence: true,length:{maximum: 140}}
  validates :user_id,{presence: true}
 mount_uploader :postimage, PostimageUploader
 belongs_to :user
 has_many :return,dependent: :destroy
 
 acts_as_taggable_on :labels,:tag_list # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
                              # つまり、post.tag_list が追加される
    acts_as_taggable_on :interests  
    
  def user
    return  User.find_by(id: self.user_id)
  end
  
  def returns
    return Return.find_by(post_id: self.id)
  end
  
  def like_count
    return   Like.where(post_id: self.id).count
  end

def self.search(search)
  if search
   Post.where(['content LIKE ?', "%#{search}%"])
         # raise.params.inspect
  else
    Post.all
  end
  end
  
     
end
