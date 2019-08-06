class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    Task.create(task_strong_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_strong_params)
    redirect_to tasks_path
  end

  def destroy
    # @task = task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
