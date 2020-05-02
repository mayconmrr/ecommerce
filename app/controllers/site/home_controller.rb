# frozen_string_literal: true

module Site
  class HomeController < SiteController
    def index
      @categories = Category.order_by_description
      @ads = Ad.descending_order(params[:page])
      @carousel = Ad.random(3)
    end
  end
end
