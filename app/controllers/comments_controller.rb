class CommentsController < ApplicationController
  before_action :ensure_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    Climb.find(params[:id]).comments.push(@comment)
    if @comment.save
      flash[:notice] = "Congrats! Your comment has been successfuly posted."
      redirect_to climb_path(@comment.climb_id)
    else
      flash[:notice] = "There was an error in saving your comment: #{@comment.errors.full_messages.join(', ')}"
      redirect_to climb_path(params[:id])
    end
  end

  def show
    # redirect_to climb_path(@comment.climb_id)
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Congrats! Your comment has been successfuly updated."
      # redirect_to climb_path(@comment.climb_id)
    else
      flash[:notice] = "There was an error in updating your comment: #{@comment.errors.full_messages.join(',')}"
      # redirect_to climb_path(@comment.climb_id)
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Your comment has been successfully deleted."
    # redirect_to climb_path(@comment.climb)
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :body)
    end

    def ensure_authorization
      @comment = Comment.find(params[:id])
      redirect_to climb_path(@comment.climb_id) unless @comment.user_id == session[:user_id]
    end
end
