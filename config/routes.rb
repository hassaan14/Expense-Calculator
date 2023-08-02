Rails.application.routes.draw do
  root "propertyrecords#index"

  resources :propertyrecords do

    member do
      put :archive
      patch :restore, action: :restore
    end
    resources :cashrecords
  get 'cashin', to: 'cashrecords#cashin'
  end

  get "archived", to: "propertyrecords#archived"
  delete "destroy_permanent", to: "propertyrecords#destroy_permanent"

  get 'cashout', to: 'cashrecords#cashout'
  post 'cashout', to: 'cashrecords#create_cashout'
  delete 'cashout', to: 'cashrecords#destroy_cashout'

end
