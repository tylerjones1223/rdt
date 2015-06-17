class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.votes.find_or_create_by(link_id: params[:id]).update(vote: params[:vote])
    redirect_to :root
  end
  
end