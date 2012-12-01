ChristmasCard::Application.routes.draw do
  resources :members


  resources :destinations


  root :to => "home#index"
end
