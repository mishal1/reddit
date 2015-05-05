class CommentsController < ApplicationController

  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @link.comments.create(comment_params)
    redirect_to links_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end

end
