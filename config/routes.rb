Rails.application.routes.draw do
  namespace :admin do
    resources :cron_requests do 
    	get '/logs' => 'cron_requests#logs'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
