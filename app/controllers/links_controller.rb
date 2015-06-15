class LinksController < ApplicationController

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

  protected
  def validation(url)
    result = url
    if /^https?:\/\/.+$/.match(url) == nil
      result = "http://" + url
    end
    return result
  end

end
