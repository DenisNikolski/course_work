class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admin = Admin.all
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

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end
