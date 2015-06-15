class CommentsController < ApplicationController
  before_action :authenticate_users!, only: [:create]
  def create
    link_id = params[:id]
    content = params[:content]
    current_user.comments.create(link_id: link_id, content: content)
    redirect_to link_id_path(Link.find(link_id))
  end

end