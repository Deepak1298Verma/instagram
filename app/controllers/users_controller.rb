class UsersController < ApplicationController
	def show	
  	end

  	def edit
  		@user = User.find(params[:id])	
  	end

  	def update
	  current_user.update(params[:id])
	  redirect_to current_user
	end

	def update
    @user = User.find(params[:id])

	    respond_to do |format|
		    if @user.update_attributes(user_params)
		        format.html { redirect_to @user, notice: 'Cart was successfully updated.' }
		        format.json { render :show, status: :ok, location: @user }
			else
			        format.html { render :edit }
			        format.json { render json: @cart.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def user_params
	  params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
	end
end
