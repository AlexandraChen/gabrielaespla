class SitesController < ApplicationController
  def bio
  end

  def index
    @index_photos = []

    Piece.all.shuffle[0..6].each do |x|
      @index_photos << x
    end

    Project.all.shuffle[0..3].each do |x|
      @index_photos << x
    end

    @index_photos.shuffle
    end

  def contact_me

  end
end
