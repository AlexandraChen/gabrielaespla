class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update , :destroy]
  def all_projects
    @projects = Project.order("created_at DESC")
  end
  
  def show
  end

  def new
    if current_user.admin?
      @project = current_user.projects.new
      @photo = @project.photos.new
    else
      flash[:notice] = "Tienes que ser un adminstrador para agregar proyectos!"
      redirect_to root_path
    end 
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      if params[:images]
        params[:images].each do |image|
          @photo = @project.photos.create(img: image)
        end
      end
      redirect_to admin_panel_path, notice: "Nuevo proyecto creado exitosamente!" 
    else
      flash[:notice] = "Hubo un error al crear la proyecto."
      render :new
    end
  end

  def edit
    if current_user.admin?
      @project = current_user.projects.find(params[:id])
      @photo = @project.photos.new
    else
      flash[:notice] = "Tienes que ser un adminstrador para editar proyectos!"
        redirect_to root_path
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    if params[:photo_ids]
      params[:photo_ids].each do |photo|
        Photo.find(photo).destroy
      end
    end

    if @project.update_attributes(project_params)
      if params[:images]
        params[:images].each do |image|
          @project.photos.create(img: image)
        end
      end
      redirect_to admin_panel_path, notice: "Proyecto editado exitosamente!"
    else
      flash[:notice] = "Hubo un problema con la edición de proyecto. Intenta nuevamente!"
      render :edit
    end
    
  end

  def destroy
    @project.destroy
    redirect_to admin_panel_path, notice: "Proyecto eliminado."
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :published_date, :place, photos_attributes: [ :_destroy, img: [] ], photo_ids: [] )
  end 

  def photo_params
    #photo is inside :project
    photo_json = params[:project]
    params.require(:photo).permit(:img, :project_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
