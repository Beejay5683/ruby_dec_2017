class SecretsController < ApplicationController
  def index
  	@secrets = Secret.all

  end

  def create
  	secret = Secret.create(secret_params)
  	return redirect_to userss_path session[:user_id]
  end

  def delete
  	secret = Secret.find(params[:secrets]).destroy
  	return redirect_to :back
  end

  private
  	def secret_params
  		params.require(:secrets).permit(:content).merge(user_id: session[:user_id])
  	end
end
