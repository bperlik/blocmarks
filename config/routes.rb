Rails.application.routes.draw do

  devise_for :users

  post :incoming, to: 'incoming#create'

  resources :topics do
   resources :bookmarks, except: [:index]
  end

  resources :bookmarks

  resources :users, only: [:new, :index, :show]

  get 'about' => 'welcome#about'

  get 'index' => 'welcome#index'

  root 'welcome#index'

end
