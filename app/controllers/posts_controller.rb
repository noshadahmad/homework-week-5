class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
        @post = Post.all 

    end
    def new
        @post = Post.new 

    end
    def create
        @post = Post.new params.require(:post).permit(:title, :body)
        if @post.save
        flash[:notice] = "Post created successfully"
        redirect_to post_path(@post)
        else 
            render :new
        end

    end
    def show
        @post = Post.find params[:id]
        @comment = Comment.new 
        @comments = @post.comments
    end
    
    def edit
        @post = Post.find params[:id]

    end
    def update
        
       if @post.update params.require(:post).permit(:title, :body)
        redirect_to post_path(@post)

       end

    end
    def destroy

        @post.destroy 
    
        redirect_to post_path
    end
    private
    def find_post
        @post = Post.find params[:id]
    end

end
