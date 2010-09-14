class CommentsController < ApplicationController

  before_filter :require_user, :only => [:new, :create]
  
  def create
      #@post = Post.find(params[:post_id])
      @comment = Comment.new( :post_id => params[:post_id],
                               :comment => params[:comment][:comment],
                               :author  => current_user.full_name
                             )

    if @comment.save
      flash[:notice] = 'Comment was successfully added.'
      
      render :update do |page|
        page.insert_html :bottom, 'comments', :partial => 'comment'
        page[:comment_comment].clear
        #page["comment_#commentsp"].visual_effect :highlight, :duration => 3.5
       
      end
    end
  end
end
