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

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task.id)
    else
      render :update
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    
    redirect_to task_path
  end

  private

  # Strong params: only let certain attributes
  # through
  def task_params
    return params.require(:task).permit(
      :action,
      :description,
    )
  end


end
