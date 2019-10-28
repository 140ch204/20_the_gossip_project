class LandingController < ApplicationController
  def page

    @gossip_array = Gossip.all
    
  end

end
