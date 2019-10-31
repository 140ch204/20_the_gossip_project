module GossipHelper
  def right_user
    @gossip=Gossip.find(params[:id])
    @user=User.find(@gossip.user_id)
    unless current_user == @user
      redirect_to gossip_index_path 		
    end
  end
end
