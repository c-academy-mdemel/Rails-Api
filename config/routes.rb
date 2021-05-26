Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :processor
  end

  # namespace 'api' do
  #   resources :test
  # end
end
