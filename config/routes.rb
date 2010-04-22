ActionController::Routing::Routes.draw do |map|
  map.resources :products
  map.resources :orders, :member => {:history => :get}
  map.resources :users
  map.resources :shop, :only => :none, :member => {:checkout => :get}, :collection => {:confirm => :any}
end
