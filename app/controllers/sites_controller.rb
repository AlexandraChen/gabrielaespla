class SitesController < ApplicationController
  def bio
    @contact_form = ContactForm.new
  end

  def index
    @pieces = Piece.order("created_at DESC")
    @contact_form = ContactForm.new
  end

  def contact_me
    @contact_form = ContactForm.new
  end
end
