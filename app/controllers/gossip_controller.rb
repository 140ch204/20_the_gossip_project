class GossipController < ApplicationController
  #def show
  #  id_gossip = params[:id].to_i
  #  @gossip = Gossip.all[id_gossip]
#
#  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    # Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(user_id: User.all.sample.id, title: params[:gossip_title], content: params[:gossip_content])
    puts "mes params = ", params

    if @gossip.save
      @gossip_array = Gossip.all
      render 'index'
    else
      @gossip.destroy
      render 'new'
    end
    puts @gossip.errors.full_messages
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    id_gossip = params[:id].to_i
    @gossip = Gossip.all[id_gossip]
    @user = User.all
  end

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossip_array = Gossip.all
    @user = User.all

    

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end


  
end
