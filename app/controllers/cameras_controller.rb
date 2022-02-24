class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @cameras = policy_scope(Camera)
  end

  def show
    authorize @camera
  end

  def new
    @camera = Camera.new
    authorize @camera
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user
    authorize @camera
    if @camera.save!
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  def edit
    authorize @camera
  end

  def update
    authorize @camera
    @camera.update(camera_params)

    redirect_to camera_path(@camera)
  end

  def destroy
    authorize @camera
    @camera.destroy
    redirect_to cameras_path
  end

  private

  def set_camera
    @camera = Camera.find(params[:id])
  end

  def camera_params
    params.require(:camera).permit(:category, :make, :model, :year, :condition, :price, :photo)
  end
end
