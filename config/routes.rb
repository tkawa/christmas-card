ChristmasCard::Application.routes.draw do
  resources :destinations do
    resource :card, controller: 'destinations/cards', only: [:show, :create, :update, :destroy], shallow: true do
      resources :messages
    end
  end
  resources :members
  resources :cards, only: :show do
    resources :replies, only: [:create, :update, :destroy]
  end

  root to: 'home#index', via: :get
end
