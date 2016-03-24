class SitesController < ApplicationController
  def bio
  end

  def index
    @index_photos = []

    Piece.all.shuffle[0..5].each do |x|
      @index_photos << x
    end

    Project.all.shuffle[0..2].each do |x|
      @index_photos << x
    end

    @index_photos.shuffle
    end

  def contact_me

  end
end
