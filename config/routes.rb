Rails.application.routes.draw do
  resources :shortenedurls
  post 'shorten', to: 'shortenedurls'
  get '/:id', to: 'shortenedurls#show'

end
