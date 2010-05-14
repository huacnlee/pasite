ActionController::Routing::Routes.draw do |map|
  map.root :controller => "snippets"
  map.resources :languages
  map.resources :comments
  map.resources :users	
  map.resources :snippets, :as => "code", :collection => { :search => :get }
  map.connect "code/:id/comment",:controller => "snippets", :action => "show" ,:only => :post
  map.login "login",:controller => "home", :action => "login" 
  map.logout "logout",:controller => "home", :action => "logout" 
  map.register "register",:controller => "home", :action => "register" 
  map.settings "settings",:controller => "home", :action => "settings" 
  map.password "password",:controller => "home", :action => "password"
  map.help "help",:controller => "home", :action => "help" 	
  map.links "links",:controller => "home", :action => "links" 	
  map.lang "lang/:lang",:controller => "snippets", :action => "index"   
  map.feed "feed",:controller => "snippets", :action => "index",:type => "feed"
  map.lang_feed "lang/:lang/feed",:controller => "snippets", :action => "index",:type => "feed"
  map.user_feed ":login/feed",:controller => "snippets", :action => "index",:type => "feed"
  map.user ":login",:controller => "snippets", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
