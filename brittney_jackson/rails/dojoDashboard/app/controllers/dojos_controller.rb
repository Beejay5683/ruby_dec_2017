class DojosController < ApplicationController

  def index
  	@dojos = Dojo.all
  	@count = Dojo.all.count
  	return render 'index.html.erb'
  end

  def new
  	return render 'new.html.erb'
  end

  def create
  	@create = Dojo.create(dojo_params)
  	
  	flash[:messages] = 'Your Dojo was successfully added to the database'
  	if errors
  		flash[:errors] = errors
  		redirect_to '/dojos/new'
  	end
  	return redirect_to '/dojos'
  end

  def show
  	@dojo = Dojo.find(params[:id])
  	return render 'show.html.erb'

  end

  def edit
  	@info = Dojo.find(params[:id])
	session[:id] = params[:id]
	return render 'info.html.erb'
  end

  def update
  	edits = Dojo.find(session[:id]).update(dojo_params)
    return redirect_to '/dojos'
  end

  def destroy
  	delete = Dojo.find(params[:id]).destroy
  	return redirect_to '/dojos'
  end

  private
    	def dojo_params
     		params.require(:dojo).permit(:branch, :street, :city, :state)
    	end



end
