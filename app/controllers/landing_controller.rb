class LandingController < ApplicationController
  def page

    @gossip = Gossip.all
  end




end
