require 'csv'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentShoppingCart
  before_action :set_shopping_cart
end
