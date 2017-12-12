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

  end

  def edit
  	@user = User.find(params[:id])

  end

  def update
  	edit = User.find(params[:id]).update(user_params)
  	edit.save

  	# p user_params

  	# if edit.valid?
  	# 	edit.save
  	# 	return redirect_to userss_path user.id 
  	# elsif
  	#   	flash[:errors] = user.errors.full_messages
  	# 	return redirect_to :back
  	# end
  end

  private
  	def user_params
  		params.require(:userss).permit(:name, :email, :password, :password_confirmation)
  	end
end
