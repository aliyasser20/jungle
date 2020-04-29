class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @productsCount = Product.count
    @categoriesCount = Category.count
  end
end
