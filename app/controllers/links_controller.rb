class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    Link.create(link_params)
    redirect_to '/links'
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to '/links'
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = 'Link deleted successfully'
    redirect_to '/links'
  end

  def link_params
    params.require(:link).permit(:title)
  end

end
