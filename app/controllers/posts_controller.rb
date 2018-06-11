class PostsController < ApplicationController
  # before_action :authenticate_user!, only:[:new, :vote]
  # before_action :authenticate_user!
  # before_action :upvote, except: :index
  respond_to :js, :json, :html

  def new
    @post = current_user.posts.build
  end

  def index
    @posts = Post.all
    @post = Post.last
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    p post_params
    @post = current_user.posts.build(post_params)
    p @post
    if @post.save!
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image,:description)
  end
end
