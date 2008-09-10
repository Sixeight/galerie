class MenuController < ApplicationController
  before_filter :authorize

  def index
    @images = Image.paginate :page => params[:page], :per_page => 15, :order => 'created_at desc'
  end

  def upload
  end

#   def help
#   end

  def create
    @image = Image.new(params[:images])
    if @image.save
      flash[:notice] = 'Upload has completed!'
      redirect_to :action => 'upload'
    else
      render :action => :upload;
    end
  end
end
