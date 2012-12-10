ChristmasCard::Application.routes.draw do
  resources :destinations do
    resource :card, controller: 'destinations/cards', only: [:show, :create, :update, :destroy], shallow: true do
      resources :comments
    end
  end
  resources :members
  resources :cards, only: :show

  root to: 'home#index', via: :get
end
