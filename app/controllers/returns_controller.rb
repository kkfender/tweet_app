class ReturnsController < ApplicationController
  
   before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
 def show
  @returns = Return.find_by(id: params[:id])


 end
  
  def new
      @returns=Return.new
  end
  
   def edit
    @returns=Return.find_by(id: params[:id])
  end
  
   def update
    @returns=Return.find_by(id: params[:id])
   
     if  @returns.update_attributes(return_params)
   
     flash[:notice]="投稿を編集しました"
    redirect_to("/posts/index")
    else
      render("returns/edit")   
    end
  end
 def destroy
    @returns=Return.find_by(id: params[:id]) 
    @returns.destroy
    redirect_to("/posts/index")
    flash[:notice]="投稿を削除しました"
  end 

  #コメント追加アクション
  def create
   @returns = Return.create(return_params)
       #raise.params.inspect
    redirect_to ("/posts/index")
  end
   def ensure_correct_user
    @returns=Return.find_by(id: params[:id])
    if @returns.user_id !=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  private
  #ストロングパラメータ

  def return_params
    return_params = params.require(:return).permit(:returncontent,:returnimage,:post_id)
    .merge(user_id: @current_user.id)
  end


end
