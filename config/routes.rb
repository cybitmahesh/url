Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:create, :show]
  get '/:shortened', to: 'urls#redirect', as: 'shortened_url'
end