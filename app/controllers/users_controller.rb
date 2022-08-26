class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(params[:id])
        @user.saveabctech@gmail.com
        redirect_to root_path
    end

    def edit
        @users = User.find(params[:id])        
    end

    def update
        current_user.update(params_user)
        redirect_to current_user
    end

    def follow
      @user = User.find(params[:id])
      current_user.followees << @user
      redirect_back(fallback_location: user_path(@user))
    end

    def unfollow
      @user = User.find(params[:id])
      current_user.followed_users.find_by(followee_id: @user.id).destroy
      redirect_back(fallback_location: user_path(@user))
    end

    private

    def params_user
        params.require(:user).permit(:username, :name, :website, :bio, :phone, :gender, :email, :avatar)
    end
end
