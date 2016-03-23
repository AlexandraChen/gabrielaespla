class SitesController < ApplicationController
  def bio
  end

  def index
    @index_photo = Photo.all.shuffle[0..8]
  end
end
