class ReturnsController < ApplicationController
  
 def show
  @returns = Return.find_by(id: params[:id])

#   #指定のツイートのコメントを列挙
#   @returns = Return.includes(:user).where(product_id: @product.id)

#   #いいね機能
#   @like = Like.find_by(user_id: current_user.id)
#   @likes = Like.new(user_id: current_user.id, product_id: params[:product_id])

#   #コメント追加
#   @returns = Return.new
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
# 
#  def destroy
#    @retuns = Return.find(params[:id]).destroy
#   redirect_to "/products/#{@comment.product.id}"
# end
#
  #コメント追加アクション
  def create
   @returns = Return.create(return_params)
       #raise.params.inspect
    redirect_to return_path(@returns) 
  end

  private
  #ストロングパラメータ

  def return_params
    return_params = params.require(:return).permit(:returncontent,:returnimage,:post_id)
    .merge(user_id: @current_user.id)
  end


end
