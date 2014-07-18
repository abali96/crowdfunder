class CommentsController < ApplicationController

  before_action :load_parent

  def create
    @comment = @commentable.comments.build(comment_params)
    @user = User.find(current_user)
    @comment.user_id = @user.id
    @comments = @commentable.comments

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.js {}
      else
        format.html { redirect_to :root_path, :notice => "Error in creating comment" }
        format.js {}
      end
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
