class PostsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all.order(created_at: 'DESC')
    end


    def show
    end


    def new
      @post = Post.new
    end


    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post
      else
        render 'new'
      end        
    end

    def edit
    end

    def update
      if @post.update_attributes(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    end

    def destroy
      @post.destroy
    end

    private

    def post_params
      params.require(:post).permit(:name, :content)
    end

    def set_params
      @post = Post.find(params[:id])
    end
end
