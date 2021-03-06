Rails.application.routes.draw do
  devise_for :users

  resources :candidates
  resources :uploads

  root 'static_pages#home'

  get 'help' =>'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'profile' => 'users#show'

  get 'all_users' => 'users#index' 

  patch 'user' => 'users#update'

  get 'admin_edit' => 'users#edit'

  get 'delete' => 'users#delete_user'

  get 'assign_candidate' => 'users#assign_candidate'

  post 'assign' => 'users#assign_recruiter_to_candidates'

  get 'candidates_list' => 'users#list_of_candidates'

  get 'candidate' => 'candidates#show'

  get 'new_upload' => 'uploads#new'

  get 'upload_image' => 'candidates#upload_image'

  post 'upload_file' => 'candidates#upload_file'

  get 'upload_resume' => 'candidates#upload_resume'

  post 'upload_resume_file' => 'candidates#upload_resume_file'

  get 'interview_schedule' => 'users#interview_schedule'

  post 'interview_fixed' => 'users#interview_fixed'

  get 'download' => 'candidates#download'

  get 'interview_list' => 'users#interview_list'

  get 'comment' => 'users#comment'

  post 'add_comment' => 'users#add_comment'

  get 'upcoming_interviews' => 'users#upcoming_interviews'

  get 'archive' => 'users#archive'


  devise_scope :user do
    delete 'logout', to: "devise/sessions#destroy"
  end

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
  end

  devise_scope :user do
    get "login", to: "devise/sessions#new"
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
