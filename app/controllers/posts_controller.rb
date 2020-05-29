class PostsController < ApplicationController

	def new
		@post = Post.new
		@item = Item.find(params[:item_id])
    end

    def index
        @posts = current_user.posts(params[:item_id])
    end

	def create
		item = Item.find(params[:item_id])
	    post = current_user.posts.new(post_params)
	    post.item_id = item.id
	    post.save
	    redirect_to item_path(item)
	end

	def destroy
	    item = Item.find(params[:item_id])
	    post = Post.find(params[:id])
	    post.destroy
	    redirect_to request.referer
	end

	private
	def post_params
	params.require(:post).permit(:title,:rate,:body,:item_id,:user_id)
	end

end
