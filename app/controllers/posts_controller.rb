class PostsController < ApplicationController

  def index
    @posts = Post.find(:all, :order => 'created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
     @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def show
    @post = Post.find(params[:id])    
    @comments = @post.comments.collect 
  end

end
