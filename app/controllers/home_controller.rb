class HomeController < ApplicationController
  def index
    @user = current_user
    @reading_books = UserBook.where(user_id: current_user[:id])
    @new_book = UserBook.new
    @books = Book.all
    @authors = Author.all
  end
end
