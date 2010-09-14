class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      unless request.xhr?
        redirect_back_or_default posts_path
      else
#        render :update do |page|
#          page.replace_html 'posts', :partial => 'comment'
#          page[:user_sessions_new].clear
#          page["comment_#commentsp"].visual_effect :highlight, :duration => 3.5
#        end
      end
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to posts_path
  end
  
end
