class BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def index
    @books = Book.all
    @authors = Author.all
  end

  def show
    @note = Note.new
    @user_notes = Note.where(user: current_user, book: @book)
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      UserBook.create(user_id: current_user.id, book_id: @book.id)
      redirect_to root_path
    else
      @authors = Author.all
      render 'new'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author_id, author_attributes: [:name])
  end
end
