class UsersController < ApplicationController
  
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit]}
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 6)
  end
  
  def show
    @users = User.find_by(id: params[:id])
    @posts = Post.find_by(user_id: params[:id])
   # @postall =Post.where(user_id: @users.id)
    if @posts !=nil
      @likes_count = Like.where(post_id: @posts.id).count
    end
  end
 
  def new
     @users = User.new
  end 
  
  def create        
    
   @users =User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
 
   if  @users.save
      session[:user_id]=@users.id
      redirect_to users_index_path(@users) 
      flash[:notice]="ユーザー登録を完了しました"
    else
      render("users/new")  
    end  
  end  
   
  def login_form
  end
   
  def login
    @users = User.find_by(email: params[:session][:email].downcase)
    if @users && @users.authenticate(params[:session][:password])

  #  @users = User.find_by(email: params[:email])
   # if @users && @users.authenticate(params[:password])
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
     # raise.params.inspect

   # if @users.present?
    @users = User.find_by(id: params[:id])
    #@users.name = params[:name]
    #@users.email = params[:email]
    
    @users.update_attributes(user_params)
    
  #end
    if params[:image]
      @users.image = "#{@users.id}.jpg"
      image = params[:image]
      File.binwrite("app/assets/images/#{@users.image}", image.read)
    end
    #@users.update
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@users.id}")
    #else
      #render("users/edit")  
   # end
  
      
  end
 
  def likes 
    @users = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
    
  def edit
    @users = User.find_by(id: params[:id])
  end
    
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
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
  
  def user_params

      params.require(:user).permit(
      :name, :email, :password, 
      :password_confirmation)

    end
end



