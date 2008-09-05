class WelcomeController < ApplicationController
  layout 'menu'
  before_filter :authorize, :except => :login

  # ユーザの追加の必要がないので今は使わない
#   def add_user
#     @user = User.new(params[:user])
#     if request.post? and @user.save
#       flash.now[:notice] = "user:#{user} has created"
#       @user = User.new
#     end
#   end

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to :action => :index, :controller => :menu
      else
        flash.now[:notice] = 'Invalid user/password cimbination'
      end
    end
  end

  def logout
  end
end
