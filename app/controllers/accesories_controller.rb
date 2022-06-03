class AccesoriesController < ApplicationController
  before_action :set_accesory, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @accesories = policy_scope(Accesory)
    if params[:query].present?
      @accesories = Accesory.search_by_category_make_model_price_and_condition(params[:query])
    else
      @accesories = policy_scope(Accesory)
    end
  end

  def show
    authorize @accesory
  end

  def new
    @camera = Accesory.new
    authorize @accesory
  end

  def create
    @accesory = Accesory.new(camera_params)
    @accesory.user = current_user
    authorize @accesory
    if @accesory.save!
      redirect_to accesory_path(@accesory)
    else
      render :new
    end
  end

  def edit
    authorize @accesory
  end

  def update
    authorize @accesory
    @accesory.update(accesory_params)

    redirect_to accesory_path(@accesory)
  end

  def destroy
    authorize @accesory
    @accesory.destroy
    redirect_to accesory_path
  end

  private

  def set_accesory
    @accesory = Accesory.find(params[:id])
  end

  def accesory_params
    params.require(:accesory).permit(:category, :make, :model, :year, :condition, :price, photos: [])
  end
end
