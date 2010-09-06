class CategoriesController < ApplicationController
  respond_to :html, :xml, :js

  def index
    @categories = Category.all
  end

  #def show
  #  @category = Category.find(params[:id])
  #end

  #def new
  #  @category = Category.new
  #end

  def create
    #@category = Category.new(params[:category])
    @category = Category.create(params[:category])
    if @category.save
      flash[:notice] = "Successfully created category."
      #respond_with @category
      #redirect_to categories_path
    else
    #  render :action => 'new'
    end
    respond_with @category
  end

  #def edit
  #  @category = Category.find(params[:id])
  #end

  #def update
  #  @category = Category.find(params[:id])
  #  if @category.update_attributes(params[:category])
  #    flash[:notice] = "Successfully updated category."
  #    redirect_to @category
  #  else
  #    render :action => 'edit'
  #  end
  #end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Successfully destroyed category."
    respond_with @category
    #redirect_to categories_path
  end
end

