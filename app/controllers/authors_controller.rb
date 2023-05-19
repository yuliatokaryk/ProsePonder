class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def edit; end


  def update
    if @author.update(author_params)
      flash[:notice] = "Author was update"
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end