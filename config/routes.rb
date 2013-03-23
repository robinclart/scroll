Scroll::Engine.routes.draw do
  scope "/scroll" do
    resources :pages
    resources :rows
    resources :components
  end

  get "/*path" => "pages#show"
end
