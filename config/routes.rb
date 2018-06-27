Rails.application.routes.draw do

    get 'publish/index'
    resources :publish, only: [:destroy]
    resources :comments
    resources :posttags
    mount Ckeditor::Engine => '/ckeditor'
    resources :tags
    resources :posts, :path => 'blog/posts'
    get 'home/index'

    get 'home/about'

    get 'home/contact'

    get 'home/postold'

    get 'home/postnew'
    get 'home/search'
    get 'home/tag'
    get 'home/year'
    resources :home, param: :slug
    
     devise_for :users, :path => 'account123'
     resources :users, :path => 'blog/users'
     root 'home#index'




match '*path', via: :all, to: redirect('/404')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
