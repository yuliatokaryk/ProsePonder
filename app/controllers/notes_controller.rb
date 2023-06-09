class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def show
    authorize @note
    rescue Pundit::NotAuthorizedError
    redirect_to root_path, alert: "You are not authorized to view this note."
  end

  def new
    @notes = Note.new
  end

  def edit
    authorize @note
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if @note.save
      flash[:notice] = "Note was added"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "note wasn't add"
      render 'new'
    end
  end

  def update
    authorize @note

    if @note.update(note_params)
      flash[:notice] = "Note was update"
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    authorize @note
    @note.destroy
    redirect_to root_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :book_id)
  end
end
