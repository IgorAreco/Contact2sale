class PagesController < ApplicationController
  def home
    # render json: { message: 'Ruby on Rails Challenge 20200810' }, status: 200
    # respond_to do |format|
    #   format.html  # index.html.erb
    #   format.json  { render json: { message: 'Ruby on Rails Challenge 20200810' }, status: 200 }
    # end
    @products = Product.all
  end
end
