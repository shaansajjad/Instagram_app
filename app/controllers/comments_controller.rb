class CommentsController < ApplicationController
  before_action :set_post
  # def index
  #     # @comments = @post.comments.order('created_at asc')
  #   respond_to do |format|
  #     format.html { render layout: !request.xhr? }
  #       #// never render a layout in response to XHR requests
  #   end
  # end

  def create
    @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:alert] = 'Check the comment form, something went wrong.'
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted."
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
