class ProfileController < ApplicationController
  before_filter :authenticate_user!

  #Lists current_user's contents
  def products
    @products = current_user.products.active
  end

  #Saves new uploaded attachment
  def upload
    if request.get?
      @product = current_user.products.new
    else
      @product = current_user.products.new(params[:product])
      if @product.save
        respond_to do |format|
          format.html { redirect_to profile_product_path(@product.code), :notice => "Successfully uploaded" }
          format.js { render text: "ok" }
        end
      end
    end
  end

  #Updates asset (name - price etc.)
  def update_product
    @product = current_user.products.active.find_by_code(params[:code])
    @product.update_attributes(params[:product])
    respond_to do |format|
      format.html { redirect_to profile_product_path(@product.code) }
      format.json { render json: @product, status: :created }
    end
  end

  #Shows uploaded content
  def edit_product
    @product = current_user.products.active.find_by_code(params[:code])
  end

  #Updates content
  def save_content
    @product = current_user.products.active.find_by_code(params[:code])
    @product.update_attributes(params[:product])
    respond_to do |format|
      format.html { redirect_to profile_product_path(@product.code) }
      format.json { render json: @product, status: :created }
    end
  end


  #Delete cover
  def delete_product
    @product = current_user.products.active.find_by_code(params[:code])
    @product.update_column("deleted_at", Time.now)
    respond_to do |format|
      format.html { redirect_to profile_products_path() }
    end

  end

  #Delete cover
  def delete_content
    @product = current_user.products.active.find_by_code(params[:code])
    @product.contents.where(:id => params[:id]).first.destroy
  end


  #Delete cover
  def delete_cover
    @product = current_user.products.active.find_by_code(params[:code])
    @product.image.destroy
    respond_to do |format|
      format.html { redirect_to profile_product_path(@product.code) }
      format.js { render :nothing => true }
    end
  end

  #List my sold orders
  def sold_orders
    @orders = current_user.sold_orders
  end

  #List my sold orders
  def sold_order
    @order = current_user.sold_orders.find(params[:id])
    @product = @order.product
  end

  #List my bought orders
  def bought_order
    @order = current_user.bought_orders.find(params[:id])
    @product = @order.product
  end

  #List my bought orders
  def bought_orders
    @orders = current_user.bought_orders

  end


end