class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
      render :index
    else
      render_error
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.present?
      @product.destroy
      render json: { message: 'Product has been deleted' }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Product not found' }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :type, :rating, :price)
  end

  def render_error
    render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
  end
end
