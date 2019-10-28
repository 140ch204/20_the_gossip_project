class GossipController < ApplicationController
  def show
    id_gossip = params[:id].to_i
    @gossip = Gossip.all[id_gossip]

  end
end
