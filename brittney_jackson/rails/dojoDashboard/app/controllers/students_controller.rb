class StudentsController < ApplicationController

  def index
  	@dojo = Dojo.find(params[:dojo_id])
  	@students = Dojo.find(params[:dojo_id]).students
  	return render 'index.html.erb'
  end

  def new
  	@dojo = Dojo.find(params[:dojo_id])
  	@dojos = Dojo.all
  	return render 'new.html.erb'
  end

  def create
  	@create = Student.create(student_params)
  	puts params[:dojo_id]
  	
  	return redirect_to '/dojos'
  end

  def show
  	@student = Student.find(params[:id])
  	@dojo = Dojo.find(params[:dojo_id])
  	@students = Dojo.find(params[:dojo_id]).students
  	session[:dojo_id]=params[:dojo_id]
  	return render 'show.html.erb'

  end

  def edit
  	@info = Student.find(params[:id])
  	@dojos = Dojo.all
	session[:id] = params[:id]
	return render 'edit.html.erb'
  end

  def update
  	edits = Student.find(session[:id]).update(student_params)
    return redirect_to '/dojos'
  end

  def destroy
  	delete = Student.find(params[:id]).destroy
  	return redirect_to '/dojos'
  end

  private
    	def student_params
     		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    	end



end

