# frozen_string_literal: true

module Site
  class SearchController < SiteController
    def ads
      @ads = Ad.search(params[:q], params[:page])
      @categories = Category.all
    end
  end
end
