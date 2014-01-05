class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => :checkout

  def index

  end


  def from_code
    @product = Product.active.find_by_code(params[:code])
    if @product.blank?
      flash[:error] = "Page not found"
      redirect_to root_path and return
    end
  end

  def checkout
    if request.get?
      @order = Order.new
      @product = Product.active.find_by_code(params[:code])
      @order.product = @product
    else
      @order = Order.new(params[:order])
      @product = Product.active.find_by_code(params[:code])
      @order.product = @product
      @order.buyer_id = current_user.id
      if @order.save
        redirect_to profile_bought_order_path(@order)
      else
        flash[:error] = @order.errors.full_messages.first
        render 'checkout'
      end
    end
  end

end