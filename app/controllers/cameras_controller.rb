class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :destroy]

  def index
    @cameras = Camera.all
  end

  def show
    @camera = Camera.new
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
