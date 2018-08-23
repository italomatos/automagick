Rails.application.routes.draw do
  namespace :admin do
    resources :cron_requests do 
    	get '/logs' => 'cron_requests#logs'
    	get '/run_now' => 'cron_requests#run_now'
    end
  end
  devise_for :users

  root to: "admin/cron_requests#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
