class SitesController < ApplicationController
  def bio
  end

  def index
    @pieces = Piece.order("created_at DESC")
    @drawing = Piece.where(piece_type:"Dibujo").first.photos.first
    @performance = Piece.where(piece_type:"Performance").first.photos.first
    @mural = Piece.where(piece_type:"Mural").first.photos.first
    @painting = Piece.where(piece_type:"Pintura").first.photos.first
    @contact_form = ContactForm.new
  end

  def contact_me

  end
end
