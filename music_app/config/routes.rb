Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resource :sessions, only: [:create , :destroy , :new]

resource :users, only: [:create , :new , :show]


end
