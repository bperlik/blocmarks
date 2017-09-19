Rails.application.routes.draw do

  devise_for :models
  post :incoming, to: 'incomings#create'

  resources :topics do
   resources :bookmarks, except: [:index]
  end

  resources :bookmarks

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
