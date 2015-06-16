class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def new
    @action = links_path
    render :new
  end

  def create
    destination = self.validation(params[:destination])
    @link = current_user.links.create(destination: destination,
                        title: params[:title]
                        )
    redirect_to :root
  end

  def find
    @link = Link.find(params[:id])
    @comments = @link.comments.all.order(created_at: :desc)
    render :find
  end

  def index
    @links = Link.all.order(created_at: :desc)
  end

  def delete
    link = Link.find(params[:id])
    if link.user_id == current_user.id
      link.destroy
      flash[:notice] = "You deleted your post!"
    else
      flash[:notice] = "You can't do that"
    end
    redirect_to :root
  end

  protected
  def validation(url)
    result = url
    if /^https?:\/\/.+$/.match(url) == nil
      result = "http://" + url
    end
    return result
  end

end
