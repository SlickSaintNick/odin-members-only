class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    redirect_to action: "index" unless user_signed_in?

    @post = Post.new
  end

  def create
    redirect_to action: "index" unless user_signed_in?

    @post = Post.new(post_params)

    if @post.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
