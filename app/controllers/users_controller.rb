class UsersController < ApplicationController
  before_action :on, only:[:edit, :update]
  def index
   @users = User.all
   @book = Book.new
   @user=current_user
  end

  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book_new = Book.new
  end

  def edit
     @user=current_user
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated book successfully "
       redirect_to user_path(@user.id)
     else
       render :edit
     end
  end

  private

  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)  end

  def on
     @user = User.find(params[:id])
   if @user != current_user
       redirect_to user_path(current_user.id)

   end
   end
end
