class MenuController < ApplicationController
  before_filter :authorize

  def index
    user = User.find(session[:user_id])
    images =
      if user.group.nil?
        # user doesn't belong to group
        user.images
      else
        # user belongs to group
        user.group.users.map {|u| u.images }.flatten
      end
    images = images.sort_by {|image| image.created_at }.reverse
    @images = images.paginate(:page => params[:page], :per_page => 15)
  end

  def my_page
    @images = pagenated_image_for(session[:user_id])
  end

  def upload
  end

  def download
    send_file File.join(RAILS_ROOT, 'public', params[:path])
  end

  def delete
    @image = Image.find params[:id]
    @image.destroy
  rescue
    flash[:notice] = 'no such images!'
  ensure
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

  private

  def pagenated_image_for(user_id)
    user = User.find user_id
    user.images.paginate :page => params[:page], :per_page => 15, :order => 'created_at desc'
  end
end

