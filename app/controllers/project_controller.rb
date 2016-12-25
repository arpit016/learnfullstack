class ProjectController < ApplicationController
  before_action :authenticate_user!, only:[:myprojects]
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.order(:tag)
    
    @joined = false
    
    if !current_user.nil? && !current_user.projects.nil?
      @joined = current_user.projects.include?(@project)
    end
    
    @users = @project.users.order('created_at desc').first(10)
  end
  
  def myprojects
    @projects = current_user.projects
  end
end
