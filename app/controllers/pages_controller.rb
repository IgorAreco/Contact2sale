class PagesController < ApplicationController
  def home
    render json: { message: 'Ruby on Rails Challenge 20200810' }, status: 200
  end
end
