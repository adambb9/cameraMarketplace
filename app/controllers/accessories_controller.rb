class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @accessories = policy_scope(Accessory)
    if params[:query].present?
      @accessories = Accessory.search_by_category_make_model_price_and_condition(params[:query])
    else
      @accessories = policy_scope(Accessory)
    end
  end

  def show
    authorize @accessory
  end

  def new
    @accessory = Accessory.new
    authorize @accessory
  end

  def create
    @accessory = Accessory.new(accessory_params)
    @accessory.user = current_user
    authorize @accessory
    if @accessory.save!
      redirect_to accessory_path(@accessory)
    else
      render :new
    end
  end

  def edit
    authorize @accessory
  end

  def update
    authorize @accessory
    @accessory.update(accessory_params)

    redirect_to accessory_path(@accessory)
  end

  def destroy
    authorize @accessory
    @accessory.destroy
    redirect_to accessory_path
  end

  private

  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

  def accessory_params
    params.require(:accessory).permit(:category, :make, :model, :year, :condition, :price, photos: [])
  end
end
