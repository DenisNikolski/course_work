class ShoppingCartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    @shopping_carts = ShoppingCart.all
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
    @product = Hash.new []
    @element = []
    @shopping_cart_items = ShoppingCartItem.where(shopping_cart_id: @shopping_cart.id)
    @shopping_cart_items.each do |item|
      case item.category_id
      when 1
        product = Pipe.find(item.product_id)
        @element = [[PipeDescr.find(item.product_item_id), item.amount, item.total_price]]
      when 2
        product = Valve.find(item.product_id)
        @element = [[ValveDescr.find(item.product_item_id), item.amount, item.total_price]]
      when 3
        product = Radiator.find(item.product_id)
        @element = [[RadiatorDescr.find(item.product_item_id), item.amount, item.total_price]]
      else
        product = ''
      end
      @product[product] += @element
      @element.clear
    end
  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = ShoppingCart.new
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    respond_to do |format|
      if @shopping_cart.save
        format.html {redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.'}
        format.json {render :show, status: :created, location: @shopping_cart}
      else
        format.html {render :new}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /shopping_carts/1
  # PATCH/PUT /shopping_carts/1.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.html {redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.'}
        format.json {render :show, status: :ok, location: @shopping_cart}
      else
        format.html {render :edit}
        format.json {render json: @shopping_cart.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @shopping_cart.destroy if @shopping_cart.id == session[:shopping_cart_id]
    session[:shopping_cart_id] = nil
    respond_to do |format|
      format.html {redirect_to shopping_carts_url, notice: 'Shopping cart was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shopping_cart_params
    params.fetch(:shopping_cart, {})
  end

  def invalid_card
    logger.error "Attempt to access to invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That card doesn't exist"
  end
end
