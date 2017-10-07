Rails.application.routes.draw do

  get 'users/show'

  post :incoming, to: 'incoming#create'

  #/topics
  resources :topics do
    # /topics/:id/bookmarks
    resources :bookmarks, except: [:index] do
      # /topics/:id/bookmarks/:id/likes
      resources :likes, only: [:index, :create, :destroy]
   end
  end

  devise_for :users
  resources :users, only: [:show]

  get 'about' => 'welcome#about'

  get 'index' => 'welcome#index'

  root 'welcome#index'

end
