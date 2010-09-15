class CategoriesController < ApplicationController

  before_filter :require_user, :only => [:new, :create]

  def categories
    @categories = nil
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(params[:name])
    if @category.save
      posts_path
    end
  end
end
