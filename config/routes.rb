Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :student  
resources :instructor do 
  resources :students, only:[:name, :major, :age]
end
end 
