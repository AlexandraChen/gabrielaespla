class PiecesController < ApplicationController
  def all_pieces
    @pieces = Piece.order("created_at DESC")
    @drawing = Piece.where(piece_type:"Dibujo").first.photos.first
    @performance = Piece.where(piece_type:"Performance").first.photos.first
    @mural = Piece.where(piece_type:"Mural").first.photos.first
    @painting = Piece.where(piece_type:"Pintura").first.photos.first
  end
  
  def all_drawings
    @drawings = Piece.where(piece_type:"Dibujo")
  end

  def all_murals
    @murals = Piece.where(piece_type:"Mural")
  end

  def all_performances
    @performances = Piece.where(piece_type:"Performance")
  end

  def all_paintings
    @paintings = Piece.where(piece_type:"Pintura")
  end

  def show
    @piece = Piece.find(params[:id])
  end

  def new
    if current_user.admin?
      @piece = current_user.pieces.new
      @photo = Photo.new
    else
      flash[:notice] = "Tienes que ser un adminstrador para agregar obras!"
        redirect_to root_path
    end 
  end

  def create
    @piece = current_user.pieces.new(piece_params)
    @photo = Photo.new(photo_params)
    if @piece.save
      @photo.piece_id = @piece.id
      @photo.save
      redirect_to admin_panel_path, notice: "Nuevo obra creada exitosamente!" 
    else
      flash[:notice] = "Hubo un error al crear la obra."
      render :new
    end
  end

  def edit
    @piece = Piece.find(params[:id])
    @photo = @piece.photos.first
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update_attributes(piece_params)
    @photo = @piece.photos.first
    if current_user.admin?
      if @piece.save
        redirect_to admin_panel_path, notice: "Obra editada exitosamente!"
        return
      end
    end
    flash[:notice] = "Hubo un problema con la edición de obra. Intenta nuevamente!"
    render :edit
  end

  private
  def piece_params
    params.require(:piece).permit(:title, :tech_spec, :measurement, :piece_type, :published_date, :place)
  end

  def photo_params
    #photo is inside :piece
    photo_json = params[:piece]
    photo_json.require(:photo).permit(:img, :piece_id)
  end
end
