class LikeController < ApplicationController

  before_action :authenticate_user, only: [:create, :destroy]
  
  def create
    @like=Like.create(user_id:current_user.id, gossip_id:params[:gossip_id])
  end

  def destroy
    @gossip=Gossip.find(params[:gossip_id])
    @like=@gossip.likes.find(params[:id])
    @like.delete
  end

end
