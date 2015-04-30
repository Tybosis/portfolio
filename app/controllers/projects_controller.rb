class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_to do |format|
      format.html { redirect_to @project, notice: "Project has been created." }
      format.js
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)
    respond_to do |format|
      format.html{ redirect_to @project, notice: "Project has been updated." }
      format.js
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :technologies_used)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
