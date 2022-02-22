class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_camera, only: [ :new, :create]

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
    authorize @camera
  end

  def new
    @booking = Booking.new
    authorize @camera
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camera = @camera
    @booking.status = "Pending"
    authorize @camera
    if @booking.save!
      redirect_to camera_path(@booking.camera)
    else
      render :new
    end
  end

  #def destroy
    #@booking.destroy
    #redirect_to list_path(@bookmark.list)
  #end

  private

  def booking_params
    params.require(:booking).permit(:comment, :bid)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end
end
