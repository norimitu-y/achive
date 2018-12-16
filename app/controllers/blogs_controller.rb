class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]
  before_action :login, only:[:index, :new, :edit, :show, :destroy]

  def top
  end

  def index
    @blogs = Blog.all
    @favorites = current_user.favorites
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      #BlogMailer.blog_mail(@blog).deliver
      redirect_to blogs_path, notice: "新しいブログを投稿しました!"
    else
      render "new"
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました!"
    else
      render "edit"
    end
  end

  def destroy
    @blog.destroy
      redirect_to blogs_path, notice: "ブログを削除しました!"
  end



  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login
    if logged_in?
    else
      redirect_to new_session_path
    end
  end

end
