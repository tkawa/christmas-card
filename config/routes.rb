ChristmasCard::Application.routes.draw do
  resources :destinations


  root :to => "home#index"
end
