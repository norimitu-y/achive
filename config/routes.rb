Rails.application.routes.draw do

  root to: "blogs#top"
  resources :blogs do
    collection do
      post :confirm
      post :top
    end
  end

end
