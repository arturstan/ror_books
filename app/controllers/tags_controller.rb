class TagsController < ApplicationController
  before_action :find_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag saved"
      redirect_to tags_path
    else
      render action: 'new'
    end
  end

  def edit
  
  end

  def update
    if @tag.update_attributes(tag_params)      
      flash[:notice] = "Tag changed"
      redirect_to tags_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = "Tag deleted"
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
