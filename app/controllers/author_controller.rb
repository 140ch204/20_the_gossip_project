class AuthorController < ApplicationController
  #def show
  #  id_author = params[:id].to_i
  #  @author = User.all[id_author]
  #end

  def index
  end

  def show
    @author = User.find(params[:id])
    @gossips = Gossip.all
    @city = City.find(@author.city_id)
  end

  def new
  end

  def create
    @user=User.new(last_name:params[:last_name], first_name:params[:first_name], email: params[:email], age:params[:age], description:params[:description], city_id:City.find_by(name: params[:city_name]).id, password: params[:password], password_confirmation: params[:password_confirmation])
    puts "para author controller create: ", params
    if @user.save
      @gossip=Gossip.where(user_id:@user.id)
      @author = @user
      @city = City.find_by(name: params[:city_name])
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
