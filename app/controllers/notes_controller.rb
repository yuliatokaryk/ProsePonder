class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = Note.all
  end

  def show; end

  def new
    @notes = Note.new
    @books = Book.all
  end

  def edit; end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if @note.save
      flash[:notice] = "Note was added"
      redirect_to notes_path
    else
      @books = Book.all
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      flash[:notice] = "Note was update"
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :book_id)
  end
end
