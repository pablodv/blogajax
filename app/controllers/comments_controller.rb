class CommentsController < ApplicationController


  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(params[:comment])

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
