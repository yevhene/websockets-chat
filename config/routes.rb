Chat::Application.routes.draw do

  resources :messages, :only => [:index, :create]

  root :to => 'messages#index'

end
