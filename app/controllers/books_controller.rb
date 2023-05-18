class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if params[:book][:author_id].present?
      @book.author_id = params[:book][:author_id]
    elsif params[:book][:new_author_name].present?
      author = Author.find_or_create_by(name: params[:book][:new_author_name])
      @book.author = author
    else
      @book.author = nil
    end

    if @book.save
      flash[:notice] = "Book was added"
      redirect_to books_path
    else
      @authors = Author.all
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
    params.require(:book).permit(:title, :author_id, :new_author_name)
  end
end
