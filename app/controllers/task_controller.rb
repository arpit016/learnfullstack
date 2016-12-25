class TaskController < ApplicationController
  before_action :authenticate_user!
  
  def show
    project = Project.find(params[:project_id])
    @tasks = project.tasks.order(:tag)
    @task = @tasks.find(params[:id])
    
    @joined = false
    
    if !current_user.nil? && !current_user.projects.nil?
      @joined = current_user.projects.include?(project)
    end
    
    if @joined
      @next_task = @task.next
      @prev_task = @task.prev
    else
      flash[:notice] = "You are not subscribed to this course. Please subscribe first"
      redirect_to project
    end
  end
end
