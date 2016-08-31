class CommentsController < ApplicationController
  before_action :ensure_authorization, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(form_params)
    @comment.user_id = @current_user.id
    @comment.save
    Climb.find(params[:id]).comments.push(@comment)
    flash[:notice] = "Congrats! Your comment has been successfuly posted."
    redirect_to climb_path(@comment.climb_id)
  end

  def show
    redirect_to climb_path(@comment.climb)
  end

  def edit

  end

  def update
    @comment.update(form_params)
    flash[:notice] = "Congrats! Your comment has been successfuly updated."
    redirect_to climb_path(@comment.climb)
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Your comment has been successfully deleted."
    redirect_to climb_path(@comment.climb)
  end

  private


  def form_params
    params.require(:comment).permit(:title, :body)
  end

  def ensure_authorization
    @comment = Comment.find(params[:id])

    redirect_to climb_path(@comment.climb) unless @comment.user_id == session[:user_id]
  end
end
