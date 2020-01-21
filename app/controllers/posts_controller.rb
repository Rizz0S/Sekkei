class PostsController < ApplicationController

    def index
    @posts = Post.all
    end

    def show
    @post = Post.find(params[:id])
    end

    def new
    @post = Post.new
    render "form"
    end

    def create
    @post = Post.create(post_params)
    @users = User.all
    @origamis = Origami.all
    redirect_to post_path(post)

    end

    def edit
    @post = Post.find(params[:id])
    render "form"
    end

    def update
    Post.update(post_params)
    redirect_to post_path(post)
    end

    private

    def post_params
    params.require(:post).permit(:user_id, :origami_id, :content, :title)
    end
    

end

