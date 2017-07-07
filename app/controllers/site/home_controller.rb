class Site::HomeController < SiteController 
	
  def index
  	cookies[:user_name] = "test"
  	cookies[:lat_lon] = JSON.generate([47.68, -122.37])

  	@categories = Category.order_by_description
  	@ads = Ad.descending_order(params[:page])
  	@carousel = Ad.random(3)

  	puts ">>>>> #{cookies[:user_name]}"
  	puts ">>>>> #{cookies[:lat_lon]}"
  	puts ">>>>> #{eval(cookies[:lat_lon]).class}"
  end

end
