class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]

  def index
    @cameras = Camera.all
  end

  def show
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @camera.update(camera_params)

    redirect_to camera_path(@camera)
  end

  def destroy
    @camera.destroy
    redirect_to cameras_path
  end

  private

  def set_camera
    @camera = Camera.find(params[:id])
  end

  def camera_params
    params.require(:camera).permit(:category, :make, :model, :year, :condition, :price)
  end
end
