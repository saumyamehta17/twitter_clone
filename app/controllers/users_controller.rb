class UsersController < ApplicationController

	def new
		@user = User.new
	end	

	def create
		@user = User.new(create_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end	
	end

	def show
		@user = User.find(params[:id])
	end	

	private

	def create_params
		params.require(:user).permit(:email, :username, :name, :password, :password_confirmation)
	end	
end
