class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]
  before_action :set_camera, only: [:new, :create]
  skip_after_action :verify_policy_scoped

  def index
    @send_bookings = current_user.send_bookings
    @recieved_booking = Booking.joins(:camera).where(user: current_user)
    # raise
  end

  def show
    @camera = Camera.find(@booking.camera.id)
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
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @camera = Camera.find(@booking.camera.id)
    authorize @camera
  end

  def update
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
