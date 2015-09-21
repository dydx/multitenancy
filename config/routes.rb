class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www admin }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do

  devise_for :users

  constraints SubdomainConstraint do
    resources :posts, :path => ''
    # get '/', :to => 'posts#index'
  end

  root :to => 'pages#index'
end
