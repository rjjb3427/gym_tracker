Gym::Application.routes.draw do
  devise_for :profiles

  resources :measure_units

  resources :profiles do
    resources :diets do 
      resources :food_line_items  
    end 
  end

  match 'get_diets' => "diets#get_diets"
  
  resources :foods do 
      resources :nutritional_informations
      get :change_type, on: :collection
  end

  resources :types

  root to: "profiles#index"
end
