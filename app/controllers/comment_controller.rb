class CommentController < ApplicationController
  include CommentHelper

  before_action :authenticate_user, except: [:index, :show]
  before_action :right_user, only: [:edit, :update, :destroy]

  def new
    Comment.new
  end

  def create
    @gossip=Gossip.find(params[:gossip_id])
    @comment=@gossip.comments.new(content: params[:comment_content], user_id: current_user.id, gossip_id: params[:gossip_id])
    @user=User.find(@gossip.user_id)
    @comments=@gossip.comments
    if @comment.save
      redirect_to gossip_path(@gossip.id)
    else
      redirect_to gossip_path(@gossip.id)
    end
  end

  def show
    @comment=Comment.where(gossip_id: :gossip_id, id: params[:id])
  end

  def index
    @comments=Comment.where(gossip_id: :gossip_id)
  end

  def edit
    @gossip=Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    if @comment.update(content: params[:comment_content])
      redirect_to gossip_path(@gossip)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip)
  end

end
