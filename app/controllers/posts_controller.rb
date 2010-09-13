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

  def comment
    @comment = Comment.new(
      :post_id => flash[:post_id],
      :created_at => Time.now,
      :comment  => params[:comment][:comment]
    )
    if @comment.save
      flash[:notice] = 'Comment was successfully added.'
      #redirect_to :action=> 'show', :id => flash[:post_id]
      render :update do |page|
        page.insert_html :bottom, 'comments', :partial => 'comment'
        page[:comment_comment].clear
        #page["comment_#commentsp"].visual_effect :highlight, :duration => 3.5
        #flash.keep(:post_id)
      end
    end
  end
end
