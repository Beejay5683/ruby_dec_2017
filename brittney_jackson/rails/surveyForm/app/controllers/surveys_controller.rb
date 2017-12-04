class SurveysController < ApplicationController

	def index
		session[:counter] ||= 0
		return render 'index.html.erb'
	end

	def create
		@survey=Survey.create(user_params)
		session[:result] = user_params
		session[:counter] += 1
		flash[:success]= "Thanks for filling out the survey! This Survey has been submitted #{session[:counter]} times!"
    	return redirect_to '/surveys/show'
	end

	def show
		@result = session[:result]

		return render 'show.html.erb'
	end

	private
		def user_params
			params.require(:user).permit(:name, :location, :language, :comment)
		end

end
