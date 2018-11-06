Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/about', to: 'pages#about'
  
  resources:articles
  
  get 'cadastro', to: 'usuarios#new'
  resources :usuarios, except: [:new]
  
end
