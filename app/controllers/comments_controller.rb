class CommentsController < ApplicationController

  before_action :load_parent

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back
    end
  end

  def edit
  end

  def destroy
  end

  private
  def load_parent
    if params[:campaign_id]
      @commentable = Campaign.find(params[:campaign_id])
    elsif params[:user_id]
      @commentable = User.find(params[:user_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
