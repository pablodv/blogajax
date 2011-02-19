class CategoriesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]

  def categories
    @categories = nil
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end
end
