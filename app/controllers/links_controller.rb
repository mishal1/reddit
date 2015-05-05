class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to '/links'
    else
      render 'new'
    end
  end

  def show
    @link = find_link
  end

  def edit
    @link = find_link
  end

  def update
    @link = find_link
    @link.update(link_params)
    redirect_to '/links'
  end

  def destroy
    @link = find_link
    @link.destroy
    flash[:notice] = 'Link deleted successfully'
    redirect_to '/links'
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def find_link
    Link.find(params[:id])
  end

end
