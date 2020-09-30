class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path, notice: "User #{@user.username} has been created successfully."
    else
      flash.now.alert = "Something went wrong. Please re-enter."
      render action: :new
      # render text: "Something went wrong. Please re-enter."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to new_user_path, notice: "User #{@user.username} has been updated successfully."
    else
      flash.now.alert = "Something went wrong. Please re-enter."
      render :edit
    end
  end
end
