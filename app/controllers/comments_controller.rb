class CommentsController < ApplicationController

  def create
    link_id = params[:id]
    user_id = current_user.id
    content = params[:content]
    Comment.create(user_id: user_id, link_id: link_id, content: content)
    redirect_to link_id_path(Link.find(link_id))
  end

end