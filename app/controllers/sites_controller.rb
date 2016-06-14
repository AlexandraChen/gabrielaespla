class SitesController < ApplicationController
  def bio
    @contact_form = ContactForm.new
  end

  def index
    @pieces = Piece.order("created_at DESC")
    @project = Photo.find(141)
    @piece = Photo.find(161)
    @text = Photo.find(108)
    @bio = Piece.where(piece_type:"Pintura").first.photos.first
    @contact_form = ContactForm.new
  end

  def contact_me
    @contact_form = ContactForm.new
  end
end
