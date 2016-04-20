class TasksController < ApplicationController
  def index
    #hooking up the db
    # @albums = Album.order(artist: :asc)
    @tasks = Task.order(id: :desc)
  end

  def show
    @task = Task.where(id: params[:id]).first
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_create_params[:task])

    if @task.save
      redirect_to root_path
    else
    render :new
    end

  end

  # def destroy
  #   Task.where(id: params[:id]).destroy_all
  # end

    private
#tells us what parameters we want to use when we create an album
  def task_create_params
    params.permit(task: [:name, :description])
  end
end