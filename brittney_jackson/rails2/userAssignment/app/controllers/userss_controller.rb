class UserssController < ApplicationController

  def new
  	
  end

  def create
  	user = User.create(user_params)

  	if user.valid?
  		session[:user_id] = user.id
  		return redirect_to userss_path user.id 
  	elsif
  		
  		flash[:errors] = user.errors.full_messages
  		return redirect_to :back
  	end

  end

  def show
  	@user = User.find(params[:id])
    @mysecrets = @user.secrets
  
  end

  def edit
  	@user = User.find(params[:id])

  end

  def update
  	user = User.find(params[:id]).update(user_params)
  	p user_params
  	return redirect_to userss_path session[:user_id] 
  end

  private
  	def user_params
  		params.require(:userss).permit(:name, :email, :password, :password_confirmation)
  	end
end
