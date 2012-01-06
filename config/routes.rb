# encoding: utf-8
Pasite::Application.routes.draw do
  match '/' => 'snippets#index'
  resources :languages
  resources :comments
  resources :users
  resources :snippets do
    collection do
      get :search
    end
  end

  match 'code/:id/comment' => 'snippets#show', :only => :post
  match 'login' => 'home#login', :as => :login
  match 'logout' => 'home#logout', :as => :logout
  match 'register' => 'home#register', :as => :register
  match 'settings' => 'home#settings', :as => :settings
  match 'password' => 'home#password', :as => :password
  match 'help' => 'home#help', :as => :help
  match 'links' => 'home#links', :as => :links
  match 'lang/:lang' => 'snippets#index', :as => :lang
  match 'feed' => 'snippets#index', :as => :feed, :type => 'feed'
  match 'lang/:lang/feed' => 'snippets#index', :as => :lang_feed, :type => 'feed'
  match ':login/feed' => 'snippets#index', :as => :user_feed, :type => 'feed'
  match ':login' => 'snippets#index', :as => :user
  match '/:controller(/:action(/:id))'
end
