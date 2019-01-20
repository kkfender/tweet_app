class UsersController < ApplicationController
  
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 6)
  end
  
  def show
    @users = User.find(params[:id])
    @posts = Post.find_by(user_id: params[:id])
    @postall =Post.where(user_id: @users.id)
    @returns = Return.all
    if @posts !=nil
      @likes_count = Like.where(post_id: @posts.id).count
    end
  end
 
  def new
    @users = User.new
  end 
  
  def create        
    #raise.params.inspect
    @users =User.new(user_params)
    if @users.save
      session[:user_id]=@users.id
      flash[:notice]="ユーザー登録を完了しました"
      redirect_to users_path(@users) 
    else
      render "users/new"
    end  
  end  
   
  def login_form
  end
   
  def login
    @users = User.find_by(email: params[:session][:email].downcase)
    if @users && @users.authenticate(params[:session][:password])
      session[:user_id]=@users.id
      flash[:notice]="ログイン成功しました"
      redirect_to("/users/index")
    else
      @error_message ="E-mail address or password is wrong"
      render("users/login_form") 
    end 
  end 
   
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
    
  def update
     #raise.params.inspect
    @users = User.find_by(id: params[:id])
    if  @users.update_attributes(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@users.id}")
    else
      render("users/edit")  
    end
  end
 
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to ("/login")
  end
 
  def likes 
    @users = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
    
  def edit
    @users = User.find_by(id: params[:id])
  end
    
  def ensure_correct_user
    @users=User.find_by(id: params[:id])
    if @users.id !=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end 
 
  def follow
    @users = User.find_by(id: params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォローする
    @current_user.follow(@users)
    redirect_to("/users/#{@users.id}")
    flash[:notice] = "#{@users.name}さんフォローしました"
  end

  def unfollow
    @users = User.find_by(id: params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォロー解除する
    @current_user.stop_following(@users)
    redirect_to("/users/#{@users.id}")
    flash[:notice] = "#{@users.name}さんをフォローを解除しました"
  end
  
  def tag_list
   # order('count DESC')でカウントの多い順にタグを並べています
    @tags = User.tag_counts_on(:tags).order('count DESC')
  end
  
  def tag_list
  end
  
  private
  
  def user_params
      params.require(:user).permit(
      :name, :email, :password, 
      :password_confirmation,:img,:image_cache,:remove_img,:tag_list,:profile)
  end
end
 

