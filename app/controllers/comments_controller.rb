class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    link_id = params[:link_id]
    content = params[:content]
    current_user.comments.create(link_id: link_id, content: content)
    redirect_to link_id_path(Link.find(link_id))
  end

  def delete
    comment = Comment.find(params[:id])
    if current_user.id == comment.user_id
      comment.destroy
      flash[:notice] = "You deleted your comment!"
    else
      flash[:notice] = "You can't do that"
    end
    redirect_to :root
  end

end