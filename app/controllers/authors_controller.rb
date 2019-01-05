class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    flash[:notice] = "Author saved"
    redirect_to authors_path
  end

  def edit
  end

  def update
  end

  def index
    @authors = Author.all
  end

  def show
  end

  def destroy
  end

  private

  def author_params
    params.require(:author).permit(:name, :surname)
  end
end
