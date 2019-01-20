class PostsController < ApplicationController
  
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
  before_action :authenticate_user
 
  def index
     
     if  params[:id].present?
        @posts = Post.find_by(id: params[:id])
      else
     @post=Post.new
   end
    
     @returns = Return.all
     @tags = ActsAsTaggableOn::Tag.most_used
  
   if params[:tagsearch]
     @posts =Post.tagged_with( params[:tagsearch])
      params[:tagsearch]=nil
   
  else
     @posts = Post.search(params[:search]).order(created_at: :desc) 
     params[:search]=nil
  end 
  end  

  def show
    @posts =Post.find_by(id: params[:id])
    @users = User.find_by(id: @posts.user_id)
    @user = @posts.user
    @likes_count = Like.where(post_id: @posts.id).count
  end
  
  def new
    @posts=Post.new
  end  
  
  def create
   @posts =Post.new(post_params)
   if  @posts.save
      redirect_to("/posts/index")
      flash[:notice]="投稿を作成しました"
    else 
      render("posts/new")   
    end
  end
  
  def edit
    @posts=Post.find_by(id: params[:id])
  
    
  end
  
  def update
    @posts=Post.find_by(id: params[:id])
      if  @posts.update_attributes(post_params)
   # raise.params.inspect

    
      
     flash[:notice]="投稿を編集しました"
    redirect_to("/posts/index")
    else
      render("posts/edit")   
    end
  end
  
  def destroy
    @posts=Post.find_by(id: params[:id]) 
    
   if @posts.destroy
     @posts.tag_list.remove(@posts.all_tags_list)
   
    redirect_to("/posts/index")
    flash[:notice]="投稿を削除しました"
   
 end
  end 
  
  def ensure_correct_user
    @posts=Post.find_by(id: params[:id])
    if @posts.user_id !=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
  
    private
  def post_params

      params.require(:post).permit(
      :content, :user_id, :postimage,:remove_postimage,:interests,:tag_list)
      .merge(user_id: @current_user.id)


    end
    
    
end
 