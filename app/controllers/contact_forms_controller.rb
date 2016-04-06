class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      redirect_to :back, notice: "Mensaje enviado exitosamente"
    else
      redirect_to :back, alert: "Un error ocurrió. Por favor, intenta nuevamente"
    end
  end
end