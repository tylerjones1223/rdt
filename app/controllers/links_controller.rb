class LinksController < ApplicationController

  def new
    @action = links_path
    render :new
  end

  def create
    user_id = session[:user_id]
    @link = Link.create(destination: params[:destination],
                        title: params[:title],
                        user_id: user_id
                        )
    redirect_to :root
  end

  def find
    @link = Link.find(params[:id])
    render :find
  end

  def index
    @links = Link.all
  end

end
