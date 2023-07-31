Rails.application.routes.draw do
  root "propertyrecords#index"

  resources :propertyrecords do
  resources :cashrecords
  get 'cashin', to: 'cashrecords#cashin'
  end

  get 'cashout', to: 'cashrecords#cashout'
  post 'cashout', to: 'cashrecords#create_cashout'
  delete '/cashout/:id', to: 'cashrecords#destroy_cashout'

end
