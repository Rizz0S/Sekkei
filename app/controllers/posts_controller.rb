class PostsController < ApplicationController

    def index
    @posts = Post.all
    end

    def show
    @post = Post.find(params[:id])
    end

    def new
    @post = Post.new
    @users = User.all
    @origamis = Origami.all

    end

    def create
    @post = Post.create(post_params)
    if @post.valid?
        redirect_to post_path(@post.id)
    else
        redirect_to new_post_path
    end

    end

    def edit
    @post = Post.find(params[:id])

    end

    def update
    @post.update(post_params)

    redirect_to post_path(@post.id)

    end

    private

    def post_params
    params.require(:post).permit(:user_id, :origami_id, :content, :title)
    end
    

end

