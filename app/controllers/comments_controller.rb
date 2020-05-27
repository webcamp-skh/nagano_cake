class CommentsController < ApplicationController
	def create
    item = Item.find(params[:item_id])
    comment = current_user.item_comments.new(item_comment_params)
    comment.item_id = item.id
    comment.save
    redirect_to item_path(item)
    end

    def destroy
    item = Item.find(params[:item_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer

    end

    private
    def item_comment_params
    params.require(:comment).permit(:comment, :item_id)
    end
end
