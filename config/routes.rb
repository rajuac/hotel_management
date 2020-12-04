Rails.application.routes.draw do
 
  resources :allocations
  get "allotments/rooms", :as => :available_rooms
  get "allotments/book_room", :as => :book_room
  post "allotments/create_allot", :as => :create_allot
  get "customers/search_customers", :as => :search_customers
   resources :rooms
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
