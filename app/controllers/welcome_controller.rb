class WelcomeController < ApplicationController
  #def user
  #  @first_name = params[:first_name].capitalize
  # end

  def index

  end

  def show
    @first_name = params[:id].capitalize
  end
end
