class BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def show
    @note = Note.new
    @user_notes = Note.where(user: current_user, book: @book)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
