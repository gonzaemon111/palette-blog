class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @blog.comments
  end

  def show
  end

  def new
    @comment = @blog.comments.build
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@blog, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@blog, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_comments_path(@blog), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
