module CommentHelper

  def right_user
    @gossip=Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    unless current_user.id == @comment.user_id
      redirect_to gossip_path(params[:gossip_id])		
    end
  end

end
