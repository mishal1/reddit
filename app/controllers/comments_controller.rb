class CommentsController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @comment = Comment.new
  end

  def create
    @room = Room.find(params[:room_id])
    @room.comments.create(comment_params)
    redirect_to rooms_path
  end

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end

end
