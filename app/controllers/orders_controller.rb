class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to root_path, notice: "Order placed successfully!"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:chair_id, :full_name, :address, :city, :postal_code, :country)
  end
end
