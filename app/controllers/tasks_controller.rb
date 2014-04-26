class TasksController < ApplicationController
  before_action :find_project

  def create
    @task    = @project.tasks.new(params.require(:task).permit(:title))
    if @task.save
      redirect_to @project, notice: "Task Created Successfully!"
    else
      flash.now[:error] = "Task was not saved"
      render "projects/show"
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @project, notice: "Task deleted successfully"
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

end