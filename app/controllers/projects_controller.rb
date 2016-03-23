class ProjectsController < ApplicationController
  def all_projects
    @projects = Project.order("created_at DESC")
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def new
    if current_user.admin?
      @project = current_user.projects.new
      @photo = Photo.new
    else
      flash[:notice] = "Tienes que ser un adminstrador para agregar proyectos!"
        redirect_to root_path
    end 
  end

  def create
    @project = current_user.projects.new(project_params)
    @photo = Photo.new(photo_params)
    if @project.save
      @photo.project_id = @project.id
      @photo.save
      redirect_to admin_panel_path, notice: "Nuevo proyecto creado exitosamente!" 
    else
      flash[:notice] = "Hubo un error al crear la proyecto."
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @photo = @project.photos.first
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    @photo = @project.photos.first
    if current_user.admin?
      if @project.save
        redirect_to admin_panel_path, notice: "Proyecto editada exitosamente!"
        return
      end
    end
    flash[:notice] = "Hubo un problema con la edición de proyecto. Intenta nuevamente!"
    render :edit
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :published_date, :place)
  end

  def photo_params
    #photo is inside :project
    photo_json = params[:project]
    photo_json.require(:photo).permit(:img, :project_id)
  end
end
