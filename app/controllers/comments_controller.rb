class CommentsController < ApplicationController

  def index
    @comments = blog.comments
  end

  def show; end

  def new
    @comment = blog.comments.build
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to [blog, @comment]
    else
      flash.now[:notice] = 'Failed to create comment.'
      render :new
    end
  end

  def update
    if comment.update(comment_params)
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to [blog, comment]
    else
      flash.now[:notice] = 'Failed to update comment.'
      render :edit
    end
  end

  def destroy
    if comment.destroy
      flash[:notice] = 'Comment was successfully destroyed.'
      redirect_to blog_comments_path(blog)
    else
      flash[:notice] = 'Failed to delete comment.'
      redirect_to blog_comments_path(blog)
    end
  end

  private
    def comment
      @comment ||= Comment.find(params[:id])
    end
    helper_method :comment

    def blog
      @blog ||= Blog.find(params[:blog_id])
    end
    helper_method :blog

    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
