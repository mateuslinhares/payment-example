ActionController::Routing::Routes.draw do |map|
  map.resources :products
  map.resources :orders
  map.resources :users
  map.resources :shop, :only => :none, :member => {:checkout => :get}, :collection => {:confirm => :any}
end
