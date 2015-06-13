class CommentsController < ApplicationController

  def create
    link_id = params[:id]
    user_id = session[:user_id]
    content = params[:content]
    Comment.create(user_id: user_id, link_id: link_id, content: content)
    redirect_to :root
  end

end