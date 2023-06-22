class UserBooksController < ApplicationController
  def new
    @user_book = UserBook.new
    @books = Book.all
  end

  def create
    @user_book = UserBook.new(user_book_params)
    @user_book.user = current_user

    if @user_book.save
      redirect_to root_path
    else
      @books = Book.all
      render 'new'
    end
  end

  private

  def user_book_params
    params.require(:user_book).permit(:book_id)
  end
end
