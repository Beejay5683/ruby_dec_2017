class LikesController < ApplicationController
  def create
    user = User.find(session[:user_id])
    secret = Secret.find(params[:likes]['secret_id'])
    likes = Like.create(user: user , secret: secret)
  	return redirect_to "/secrets"
  end

  def destroy
  	@like = Like.find(params[:id])
    @like.destroy 
    return redirect_to "/secrets" 
  end

  private
  	def like_params
  		params.require(:likes).permit(:secret_id).merge(user: session[:user_id])
  	end
end
