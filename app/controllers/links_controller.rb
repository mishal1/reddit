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

  def link_params
    params.require(:link).permit(:title)
  end

end
