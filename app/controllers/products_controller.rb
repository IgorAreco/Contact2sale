class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :product_type, :rating, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
