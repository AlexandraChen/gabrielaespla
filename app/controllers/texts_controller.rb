class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update , :destroy]

  def all_texts
    @texts = Text.order("created_at DESC")
  end
  
  def show
    @text = Text.find(params[:id])
  end

  def new
    if current_user.admin?
      @text = current_user.texts.new
    else
      flash[:notice] = "Tienes que ser un adminstrador para agregar textos!"
        redirect_to root_path
    end 
  end

  def create
    @text = current_user.texts.new(text_params)
    if @text.save
      redirect_to admin_panel_path, notice: "Nuevo texto creado exitosamente!"
    else
      flash[:notice] = "Hubo un error al crear el texto."
      render :new
    end
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])
    @text.update_attributes(text_params)
    if current_user.admin?
      if @text.valid?
        @text.save
        redirect_to admin_panel_path, notice: "Texto editado exitosamente!"
        return
      end
    end
    flash[:notice] = "Hubo un problema con la edición de texto. Intenta nuevamente!"
    render :edit
  end
  
  def destroy
    @text.destroy
    redirect_to admin_panel_path, notice: "text eliminado."
  end

  private
  def text_params
    params.require(:text).permit(:title, :content, :published_date, :place)
  end

  def set_text
    @text = Text.find(params[:id])
  end
end
