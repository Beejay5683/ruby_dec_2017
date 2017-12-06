class UsersController < ApplicationController

  def index
  	@users = User.all
  	render 'index'
  end

  def create
  	users = User.create(user_params)

  	redirect_to '/users'

  end

   private
    	def user_params
     		params.require(:user).permit(:first_name, :last_name, :favorite_language)
    	end

end
