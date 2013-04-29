Scroll::Engine.routes.draw do
  scope "/scroll" do
    resources :pages do
      put :publish, on: :member
    end
    resources :rows
    resources :components
  end

  get "/*path" => "pages#show"
end
