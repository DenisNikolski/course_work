class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admin = Admin.all
    ShoppingCart.where(customer_id: nil).destroy_all
    @orders = ShoppingCart.all
    @pipes_count = ShoppingCartItem.where(category_id: 1).sum(:amount)
    @valves_count = ShoppingCartItem.where(category_id: 2).sum(:amount)
    @radiators_count = ShoppingCartItem.where(category_id: 3).sum(:amount)
  end

  def destroy_admin
    @admin = Admin.find(params[:id])
    @admin.destroy
    flash[:notice] = 'Admin is removed'
    redirect_to admin_path
  end

  def new_admin
    @admin = Admin.new
  end

  def create_admin
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'Admin is created'
      redirect_to admin_path
    else
      render 'new_admin'
    end
  end

  def download_file_carts
    orders_hash = {}

    orders = ShoppingCart.all

    orders.each do |order|
      order_id = order.id.to_s
      customer_hash = Hash.new
      orders_info_hash = Hash.new
      products_hash = Hash.new {|h, k| h[k] = []}

      orders_info_hash[:status] = order.status
      orders_info_hash[:created_at] = order.created_at

      customer = Customer.find(order.customer_id)
      customer_hash[:first_name] = customer.first_name
      customer_hash[:last_name] = customer.last_name
      customer_hash[:email] = customer.email
      customer_hash[:telephone] = customer.telephone
      orders_info_hash[:customer] = customer_hash

      shopping_cart_items = ShoppingCartItem.where(shopping_cart_id: order_id)
      shopping_cart_items.each do |item|
        product_item_hash = Hash.new
        case item.category_id
        when 1
          product = Pipe.find(item.product_id)
          product_item = PipeDescr.find(item.product_item_id)
          product_item_hash[:price] = product_item.price
          product_item_hash[:amount] = item.amount
          product_item_hash[:total_price] = item.total_price
          product_item_hash[:diameter] = product_item.diameter
          product_item_hash[:wall_thickness] = product_item.wall_thickness
        when 2
          product = Valve.find(item.product_id)
          product_item = ValveDescr.find(item.product_item_id)
          product_item_hash[:price] = product_item.price
          product_item_hash[:amount] = item.amount
          product_item_hash[:total_price] = item.total_price
          product_item_hash[:radius] = product_item.radius
          product_item_hash[:pressure] = product_item.pressure
          product_item_hash[:max_temperature] = product_item.max_temperature
        when 3
          product = Radiator.find(item.product_id)
          product_item = RadiatorDescr.find(item.product_item_id)
          product_item_hash[:price] = product_item.price
          product_item_hash[:amount] = item.amount
          product_item_hash[:total_price] = item.total_price

          product_item_hash[:height] = product_item.height
          product_item_hash[:length] = product_item.length
          product_item_hash[:weight] = product_item.weight
        end
        products_hash[product.title] << product_item_hash
      end
      orders_info_hash[:products] = products_hash
      orders_hash[order_id] = orders_info_hash
    end

    send_data orders_hash.to_json, :type => 'application/json; header=present', :disposition => "attachment; filename=orders.json"
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
