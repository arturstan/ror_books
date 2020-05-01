class AuthorsController < ApplicationController
    before_action :find_author, only: [:edit, :update, :show, :destroy]

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
    
  end

  def update
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
    
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author deleted"
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :surname)
  end

  def find_author
    @author = Author.find(params[:id])
  end
end
