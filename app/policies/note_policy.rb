class NotePolicy < ApplicationPolicy
  attr_reader :user, :note

  def initialize(user, note)
    @user = user
    @note = note
  end

  def index?
    true# Allow anyone to view the index page
  end

  def show?
    user.id == note.user_id # Only allow the owner of the note to view it
  end

  def destroy?
    show?
  end
end
