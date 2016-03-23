class SitesController < ApplicationController
  def bio
  end

  def index
    @index_photo = Photo.take(9)
  end
end
