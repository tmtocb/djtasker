class TasksController < ApplicationController

  def index ;end

  def new
    @task = Task.new
  end

  def show ;end

  private

  def tasks_params
  end

  def find_task
  end
end
