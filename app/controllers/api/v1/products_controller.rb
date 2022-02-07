class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: [:update, :destroy]

  # rescue ActiveRecord::RecordNotFound
  #   render json: { message: 'Product not found' }

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render :index, status: :created
    else
      render_error
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: { message: 'Not Updated' }
    end
  end

  def destroy
    if @product.destroy
      render json: { message: 'Product has been deleted' }
    else
      render json: { message: 'Product not found' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :product_type, :rating, :price)
  end

  def render_error
    render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
  end
end
