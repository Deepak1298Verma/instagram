class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])        
    end
    
    def create
            @post = Post.new(post_params)
            
            if @post.save
                redirect_to root_path, notice: "Welcome to Safeguarding Monitor."
            end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        
        redirect_to user_path(current_user)
    end

    private 

    def post_params
        params.require(:post).permit(:description, :image, :user_id)
    end

end
