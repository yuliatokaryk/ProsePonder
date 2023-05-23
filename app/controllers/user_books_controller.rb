class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[show]

  def new
    @user_book = UserBook.new
    @books = Book.all
    @authors = Author.all
    @book = Book.new
  end

  def create
    @user_book = UserBook.new(user_book_params)
    @user_book.user = current_user
    @user_book.state = "reading"

    if params[:user_book][:book_id].present?
      @user_book.book_id = params[:user_book][:book_id]
    elsif params[:user_book][:title].present?
      if params[:user_book][:author_id].present?
        author = params[:user_book][:author_id]
      elsif params[:user_book][:new_author_name].present?
        author = params[:user_book][:new_author_name]
      else
        author = nil
      end
      author = Author.find_or_create_by(name: params[:user_book][:new_author_name])
      book = Book.find_or_create_by(title: params[:user_book][:title], author: author)
      @user_book.book = book
    end

    if @user_book.save
      redirect_to root_path
    else
      @books = Book.all
      @authors = Author.all
      render 'new'
    end
  end

  private

  def set_user_book
    @user_book = UserBook.find(params[:id])
  end

  def user_book_params
    params.require(:user_book).permit(:book_id, :title, :author_id, :new_author_name)
  end
end
