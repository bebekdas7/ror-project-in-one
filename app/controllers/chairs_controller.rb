class ChairsController < ApplicationController
  before_action :set_chair, only: %i[ show edit update destroy ]

  def collection
    @chairs = Chair.all
  end
  def show
  end
  def new
    @chair = Chair.new
  end
  def edit
  end

  def create
    @chair = Chair.new(chair_params)

    respond_to do |format|
      if @chair.save
        format.html { redirect_to @chair, notice: "Chair was successfully created." }
        format.json { render :show, status: :created, location: @chair }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chair.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chair.update(chair_params)
        format.html { redirect_to @chair, notice: "Chair was successfully updated." }
        format.json { render :show, status: :ok, location: @chair }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chair.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chair.destroy!

    respond_to do |format|
      format.html { redirect_to chairs_path, status: :see_other, notice: "Chair was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buy_now
    @chair = Chair.find(params[:id])
    @order = Order.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chair
      @chair = Chair.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chair_params
      params.require(:chair).permit(:name, :brand, :description, :price)
    end
end
