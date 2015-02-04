class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @photos = Photo.all
    respond_with(@photos)
  end

  def show
    @album = Album.find(session[:album_id])
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    respond_with(@photo)
  end

  def edit
  end

  def create
    @album = Album.find(session[:album_id])
    @photo = @album.photos.build(photo_params)
    flash[:error] = 'Can not save more than 25 Photos per album.' unless @photo.save
    respond_with(@photo)
  end

  def update
    @photo.update(photo_params)
    respond_with(@photo)
  end

  def destroy
    @photo.destroy
    respond_with(@photo)
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :tag_line)
  end
end
