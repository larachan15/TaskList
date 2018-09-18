# TASKS = [
#   { task: "Do something"},
#   { task: "Do something else"},
#   { task: "eat dessert"}
# ]
#
# TASKS = ["clean room", "do laundry", "make lunch", "grocery shopping"]

class TasksController < ApplicationController
  def index
    return @tasks = TASKS.all
  end

  def show
    task_id = params[:id].to_i
    @task = TASKS[task_id]
    if @task.nil?
      head :not_found
    end
  end
end
