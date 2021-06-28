class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit]
  before_action :ensure_current_user, only: [:edit]

  def index
    @users = User.all
    @new_book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def ensure_current_user
    @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user.id)
      end
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
