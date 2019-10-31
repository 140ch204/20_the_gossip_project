class GossipController < ApplicationController

  include GossipHelper
  before_action :authenticate_user, except: [:index, :show]
  before_action :right_user, only: [:edit, :update, :destroy]

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    # Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(user_id: current_user.id, title: params[:gossip_title], content: params[:gossip_content])
    puts "mes params = ", params

    if @gossip.save
      @gossips = Gossip.all
      render 'index'
    else
      @gossip.destroy
      render 'new'
    end
    puts @gossip.errors.full_messages
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    puts params
    print params[:id]
    puts
    print params[:id].to_i
    @gossip = Gossip.find(params[:id])
    @author = User.find(@gossip.user_id)
    @city = City.find(@author.city_id)
    @comments=@gossip.comments
  end

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
    @user = User.all

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    puts params[:id]
    puts params[:id].to_i
    @gossip = Gossip.find(params[:id])
    @author = User.find(@gossip.user_id)
    @city = City.find(@author.city_id)
    puts @gossip, @author, @city
    puts params
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip_title], content: params[:gossip_content])
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    @gossips=Gossip.all
    render 'gossip/index'
  
  end


  
end
