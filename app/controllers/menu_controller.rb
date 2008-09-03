class MenuController < ApplicationController
  def index
    @images = Image.paginate :page => params[:page], :per_page => 15, :order => 'created_at desc'
  end

  def upload
  end

  def create
    Image.new(params[:images]).save!
    redirect_to :action => 'upload'
  end
end
