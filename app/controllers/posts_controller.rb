class PostsController < ApplicationController
  
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
  before_action :authenticate_user
 
  def index
    
    
     @returns = Return.all
     @tags = ActsAsTaggableOn::Tag.most_used
   #raise.params.inspect
   if params[:tagsearch]
     @posts =Post.tagged_with( params[:tagsearch])
      params[:tagsearch]=nil
  elsif params[:search]
     @posts = Post.search(params[:search])
     params[:search]=nil
   else
      @posts = Post.all.order(created_at: :desc)
       
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
  if  @posts =Post.create(post_params)
    #@posts=Post.new(content: params[:content],
    #user_id: @current_user.id)
   
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
    @posts.content=params[:content]
    if  @posts.save
     flash[:notice]="投稿を編集しました"
    redirect_to("/posts/index")
    else
      render("posts/edit")   
    end
  end
  
  def destroy
    @posts=Post.find_by(id: params[:id]) 
    @posts.destroy
    redirect_to("/posts/index")
    flash[:notice]="投稿を削除しました"
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
 