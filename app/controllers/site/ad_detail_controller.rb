# frozen_string_literal: true

module Site
  class AdDetailController < SiteController
    def show
      @categories = Category.order_by_description
      @ad = Ad.find(params[:id])
    end
  end
end
