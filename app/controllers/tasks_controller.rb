class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :js

  def index
    # respond_to do |format|
    #   if @example.save
    #     format.html { redirect_to @example, notice: 'Example was successfully created.' }
    #     format.json { render :show, status: :created, location: @example }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @example.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end

  private

    def all_tasks
      @tasks = Task.all
    end

    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end


end
