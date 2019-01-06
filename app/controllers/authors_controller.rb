class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author saved"
      redirect_to authors_path
    else
      render action: 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)      
      flash[:notice] = "Author changed"
      redirect_to authors_path
    else
      render action: 'edit'
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def destroy
  end

  private

  def author_params
    params.require(:author).permit(:name, :surname)
  end
end
