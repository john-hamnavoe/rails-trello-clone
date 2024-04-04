class Tasks::PositionController < ApplicationController
  def update
    @task = Task.find(params[:task_id])
    list_id = params[:parent_id]
    new_position = params[:row_position]
    @task.update(position: new_position, list_id: list_id)
    head :no_content
  end
end
