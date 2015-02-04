class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @albums = current_user.albums
    # respond_with(@albums)
  end

  def show
    respond_with(@album)
    session[:album_id] = @album.id
  end

  def new
    @album = Album.new
    respond_with(@album)
  end

  def edit
  end

  def create
    @album = current_user.albums.build(album_params)
    @album.save
    respond_with(@album)
  end

  def update
    @album.update(album_params)
    respond_with(@album)
  end

  def destroy
    @album.destroy
    respond_with(@album)
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :owner)
  end
end
