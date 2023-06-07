class ProfilesController < ApplicationController
  def show
    @user = current_user
    @order = @user.orders
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: "Your profile information was updated succesfully !"
    else 
      render :edit 
    end
  end
end
