Rails.application.routes.draw do

  get 'new', to: 'games#new'
  # the left is just the address url and the to is the method we call

  post 'score', to: 'games#score'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

