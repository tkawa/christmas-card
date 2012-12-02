ChristmasCard::Application.routes.draw do
  resources :destinations do
    resource :card, controller: 'destinations/cards' do
      resources :comments
    end
  end
  resources :members

  root to: 'home#index', via: :get
end
