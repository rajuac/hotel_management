Rails.application.routes.draw do
    root :to => "customers#home"

  get "allotments/rooms", :as => :available_rooms
  get "book_room/:id" =>"allotments#book_room", :as => :book_room
  post "allotments/create_allot", :as => :create_allot
  get "customers/search_customers", :as => :search_customers
  get "customers/home", :as => :home
  get "checkout/:id" => "allotments#checkout", :as => :checkout
   resources :rooms
  resources :customers
    resources :allotments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
