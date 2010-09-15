class PostsController < ApplicationController

  
  before_filter :require_user, :only => [:new, :create]

  def index
    @posts = Post.find(:all, :order => 'title')
  end

  def new
    @post = Post.new
  end

  def create
     @post = Post.new( :title => params[:post][:title],
                      :body => params[:post][:body],
                      :author => current_user.full_name
    )

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

  def posts
    @posts2 = nil
  end

end
