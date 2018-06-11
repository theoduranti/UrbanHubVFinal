Rails.application.routes.draw do
  devise_for :pro, :controllers => { registrations: 'registrations_pro' }
  devise_for :ele, :controllers => { registrations: 'registrations_ele' }
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'

  get "events/subscribe/:id", to: "events#subscribe"

  get "events/ele/:ele_id/:id", to: "events#addeletoinvitation"
  get "events/pro/:pro_id/:id", to: "events#addprotoinvitation"
  
  
  
end
