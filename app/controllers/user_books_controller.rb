class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[show edit update destroy]

  def index
    @user_books = UserBook.all
  end

  def show; end

  def new
    @user_book = UserBook.new
    @books = Book.all
  end

  def edit; end

  def create
    @user_book = UserBook.new(user_book_params)
    @user_book.user = current_user
    @user_book.state = "reading"

    if @user_book.save
      redirect_to user_books_path
    else
      @books = Book.all
      render 'new'
    end
  end

  def update
    if @user_book.update(user_book_params)
      redirect_to @user_book
    else
      render 'edit'
    end
  end

  def destroy
    @user_book.destroy
    redirect_to user_books_path
  end

  private

  def set_user_book
    @user_book = UserBook.find(params[:id])
  end

  def user_book_params
    params.require(:user_book).permit(:book_id)
  end
end
