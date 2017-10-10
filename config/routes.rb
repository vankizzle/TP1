Rails.application.routes.draw do
  post '/sums' => 'application#sums' 
  post '/filters' => 'application#filter'
  post '/intervals' => 'application#intervals'
  post '/lin_regressions' => 'application#lin_regressions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
