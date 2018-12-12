Rails.application.routes.draw do
  root to: "blogs#top"
  get 'sessions/new'

  resources :blogs do
    collection do
      post :confirm
      post :top  
    end
  end

  resources :users, only:[:new, :create, :show]

  resources :sessions, only:[:new, :create, :destroy]

  resources :favorites, only:[:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
