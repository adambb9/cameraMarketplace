class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_camera, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking)
    @send_bookings = current_user.send_bookings
    @recieved_booking = current_user.recieved_bookings
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camera = @camera
    @booking.status = "Pending"
    authorize @booking
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @camera = Camera.find(@booking.camera.id)
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to cameras_path
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :bid, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end
end
