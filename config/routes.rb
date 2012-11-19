DocuMentorV5::Application.routes.draw do

  resources :clients

  resources :slide_images

  resources :questions

  resources :assignments

  resources :filled_sections

  resources :docuchecks

  resources :case_studies

  resources :concepts

  resources :products



  get "welcome/index"

  match 'documents'=>"documents#index"
  match 'administrator' => 'welcome#admin_view'

  match 'user' => 'welcome#user_view'
  match 'author' => 'welcome#author_view'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  match 'product_dashboard' => 'products#dashboard'
  match 'concept_dashboard' => 'concepts#dashboard'

  match ":docket_id/documents"=>"documents#view_documents",:as=>"view_documents"
  match ':docket_id/documents/:document_id/pages' => "documents#view_document_pages",:as=>"view_document_pages"
  match ':docket_id/documents/:document_id/page/:page_id/customize' => 'documents#document_customize_view',:as=>"document_customize_view"
  match '/documents/structure_form/:page_id/:count' => "documents#structure_form"
  match '/docupedia' => "welcome#doclauncher"

  match 'add_new_slide' => 'slide_managements#add_new_slide'
  match 'slide' => 'slide_managements#index'
  match 'save_slide' => 'slide_managements#save_slide'
  match 'view_slide' => 'slide_managements#view_slides'

  match 'show_reference_doc/:docket_id/:document_id/:page_number'=>'test_management#show_reference_document',:as=>"show_reference_doc"


  #######################################test management routes################################
  match 'test_landing_page' => "test_management#landing_page"
  match 'play_quiz' => "test_management#play_quiz"
  match 'save_quiz_data' => "test_management#save_quiz_data"
  match '/test_management/list_documents/:assignment_id/:docket_id' => "test_management#list_documents",:as=>"list_documents"
  match '/test_management/play_document_test/:docucheck_id/:sequence_number' => "test_management#play_document_test",:as=>"play_document_test"
  match 'save_document_results' => "test_management#save_document_results"
  match 'take_tutorials' => "test_management#take_tutorials"
  match "/test_management/practice/:case_study_id"=>"test_management#start_practice",:as=>"start_practice"
  match '/test_management/list_dockets/:assignment_id'=>"test_management#list_dockets",:as=>"list_dockets"

  ##############################################################################################


  ##########################################result management routes##############################

  match 'result_landing_page'=>'result_management#landing_page'
  match '/result_management/show_docket_list/:case_study_id/:assignment_id'=>'result_management#show_docket_list',:as=>"show_docket_list"
  match '/result_management/show_document_list/:case_study_id/:assignment_id/:docket_id'=>'result_management#show_document_list',:as=>"show_document_list"
 # match '/result_management/show_page_list/:case_study_id/:docket_id/:document_id'=>'result_management#show_page_list',:as=>"show_page_list"
  match '/result_management/show_corrected_page/:assignment_id/:docket_id/:docucheck_id/:page_id'=>'result_management#show_corrected_page',:as=>"show_corrected_page"


  ################################################################################################



  ###########################################practice  management routes##############################

  match 'practice_landing_page'=>'practice_management#landing_page'
  match 'list_practice_details/:case_study_id'=>'practice_management#list_practice_details',:as=>"list_practice_details"
  match 'practice_document'=>'practice_management#practice_document'
  match 'save_practice_document_results'=>'practice_management#save_practice_document_results'



  ################################################################################################

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
