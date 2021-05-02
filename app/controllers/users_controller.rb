class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    # if @user == current_user
      render "edit"
    # else
    #   redirect_to user_path(current_user.id)
    # end
    #beforeで制限したため、editのif部分は不要
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "User infomation was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end

end
