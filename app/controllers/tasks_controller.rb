class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find(task_id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(action: params[:task][:action],
                    description: params[:task][:description])
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end
end
