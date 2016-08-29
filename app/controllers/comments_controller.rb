class CommentsController < ApplicationController
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
    redirect_to @comment
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def edit
      @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(form_params)
    redirect_to @comment
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private

  def form_params

    params.require(:comment).permit(:title, :body)

  end
end
