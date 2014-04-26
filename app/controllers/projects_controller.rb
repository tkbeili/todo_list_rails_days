
class ProjectsController < ApplicationController
 
  before_action :find_project, only: [:edit, :update, :show, :destroy]
  def index
    @projects = Project.all
  end

  # GET
  def new
    @project = Project.new
  end

  # POST
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to projects_url
    else
      flash[:error] = "Error saving the project"
      render :new
    end
  end

  #GET
  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_url
    else
      flash[:error] = "Error updating project"
      render :edit
    end
  end

  def show
    @task = Task.new
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end










