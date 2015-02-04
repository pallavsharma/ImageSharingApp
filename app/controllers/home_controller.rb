class HomeController < ApplicationController
  def index
    @photo = Photo.limit(25).order('id desc')
  end
end
