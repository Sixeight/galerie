class MenuController < ApplicationController
  before_filter :authorize

  def index
    @images =
      Image.paginate :page => params[:page], :per_page => 15, :order => 'created_at desc'
  end

  def my_page
    user = User.find session[:user_id]
    @images =
      user.images.paginate :page => params[:page], :per_page => 15, :order => 'created_at desc'
  end

  def config
    render :text => 'Not implemented yet.'
  end

  def upload
  end

  def delete
    begin
      @image = Image.find params[:id]
      @image.destroy
    rescue
      flash[:notice] = 'no such images!'
    end

    redirect_to :action => :my_page
  end

#   def help
#   end

  def create
    @image = Image.new(params[:images])
    @image.user_id = session[:user_id]
    if @image.save
      flash[:notice] = 'Upload has completed!'
      redirect_to :action => 'upload'
    else
      render :action => :upload;
    end
  end
end
