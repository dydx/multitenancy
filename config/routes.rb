class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www admin }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do

  # having a problem here where I want to show 'pages#index'
  # on the root_url and then show 'posts#index' on the
  # subdomain root_url
  root :to => 'pages#index'

  devise_for :users

  constraints SubdomainConstraint do
    get '/', :to => 'posts#index'
    resources :posts
  end
end
