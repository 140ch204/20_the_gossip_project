class AuthorController < ApplicationController
  def show
    id_author = params[:id].to_i
    @author = User.all[id_author]
  end
end
