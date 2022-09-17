class LensesController < ApplicationController
  before_action :set_lense, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @lenses = policy_scope(Lense)
    if params[:query].present?
      @lenses = Lense.search_by_category_make_model_price_and_condition(params[:query])
    else
      @lenses = policy_scope(Lense)
    end
  end

  def show
    authorize @lense
  end

  def new
    @lense = Lense.new
    authorize @lense
  end

  def create
    @lense = Lense.new(lense_params)
    @lense.user = current_user
    authorize @lense
    if @lense.save!
      redirect_to lense_path(@lense)
    else
      render :new
    end
  end

  def edit
    authorize @lense
  end

  def update
    authorize @lense
    @lense.update(lense_params)

    redirect_to lense_path(@lense)
  end

  def destroy
    authorize @lense
    @lense.destroy
    redirect_to lenses_path
  end

  private

  def set_lense
    @lense = Lense.find(params[:id])
  end

  def lense_params
    params.require(:lense).permit(:category, :make, :lens_type, :lens_mount, :diameter, :condition, :price, :description, photos: [])
  end
end
