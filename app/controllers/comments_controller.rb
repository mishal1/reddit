class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @room = Room.find(params[:room_id])
    @comment = Comment.new
  end

  def create
    @room = Room.find(params[:room_id])
    @room.comments.create(comment_params)
    redirect_to room_path(@room)
  end

  def edit
    @room = Room.find(params[:room_id])
    @comment = find_comment
  end

  def update
    @room = Room.find(params[:room_id])
    @comment = find_comment
    @comment.update(comment_params)

    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @comment = find_comment
    @comment.destroy
    flash[:notice] = 'comment deleted successfully'
    redirect_to room_path(@room)
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
