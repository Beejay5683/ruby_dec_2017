class PostsController < ApplicationController

  def index
  	@users = User.all
  	@posts = Post.all
    render layout: "three_column"
  end

  def create
	posts = Post.create(post_params)

  	redirect_to '/posts'

  end

   private
    	def post_params
     		params.require(:post).permit(:title, :content, :user_id)
    	end

end
