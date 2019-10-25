class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = 'Blog was successfully created.'
      redirect_to @blog
    else
      flash.now[:notice] = 'Failed to create blog.'
      render :new
    end
  end

  def update
    if blog.update(blog_params)
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to blog
    else
      flash.now[:notice] = 'Failed to update blog.'
      render :edit
    end
  end

  def destroy
    if blog.destroy
      flash[:notice] = 'Blog was successfully destroyed.'
    else
      flash[:notice] = 'Failed to delete blog.'
    end
    redirect_to blogs_path
  end

  private
    def blog
      @blog ||= Blog.find(params[:id])
    end
    helper_method :blog

    def blog_params
      params.require(:blog).permit(:content, :title)
    end
end
