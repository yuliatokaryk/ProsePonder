class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      flash[:notice] = "Book was added"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book was update"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :finish)
  end
end
