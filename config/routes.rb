ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resource :billing_information
  map.resource :password_reset
  map.resources :presentations
  map.resources :users

  map.namespace :administration do |administration|
    administration.resource :admin_session
    administration.resources :presentations
    administration.login '/login', :controller => 'admin_sessions', :action => 'new'
    administration.logout '/logout', :controller => 'admin_sessions', :action => 'destroy'
    administration.root :controller => 'home'
  end

  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => 'home'
end
