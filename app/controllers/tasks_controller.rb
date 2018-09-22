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
    @task = find_task
  end
  
  def update
    @task = find_task
    if @task.update(task_params)
      redirect_to tasks_path
    else
      head :not_acceptable
    end
  end

  # def destroy
  #   task = Task.find_by(id: params[:id])
  #
  #   task.destroy
  #   redirect_to task_path
  # end
  #
  # private
  #
  # # Strong params: only let certain attributes
  # # through
  # def task_params
  #   return params.require(:task).permit(
  #     :action,
  #     :description,
  #   )
  # end


end
