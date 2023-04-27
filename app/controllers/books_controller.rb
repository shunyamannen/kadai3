class BooksController < ApplicationController
  before_action :on, only:[:edit, :update]
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
     else
       @user = current_user
       @books = Book.all
       render :index
     end
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice] = "You have updated user successfully. "
       redirect_to book_path(@book.id)
     else
       render :edit
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, method: :delete
  end

  private
   def book_params
      params.require(:book).permit(:title, :body)
   end

   def on
     book = Book.find(params[:id])
     b = book.user
     if b  != current_user
       redirect_to books_path

   end
   end
end
