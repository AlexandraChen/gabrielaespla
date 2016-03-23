class SitesController < ApplicationController
  def bio
  end

  def index
    @index_photo = Photo.offset(rand(Photo.count)).take(9)
  end
end
