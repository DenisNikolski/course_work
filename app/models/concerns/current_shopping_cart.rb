module CurrentShoppingCart

  private

  def set_shopping_cart
    return if admin_signed_in?
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
  rescue ActiveRecord::RecordNotFound
    @shopping_cart = ShoppingCart.create(status: 'In processing')
    session[:shopping_cart_id] = @shopping_cart.id

  end
end