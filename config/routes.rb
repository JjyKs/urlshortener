Rails.application.routes.draw do
  resources :shortenedurls

  root 'shortenedurls#frontpage'

  #Shortened urls
  post 'shorten', to: 'shortenedurls'
  get '/:id', to: 'shortenedurls#show'

end
