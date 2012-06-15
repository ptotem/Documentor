# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120403060837) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "case_study_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "practice"
  end

  create_table "blank_sections", :force => true do |t|
    t.integer  "page_id"
    t.integer  "component_id"
    t.integer  "xpos"
    t.integer  "ypos"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "case_studies", :force => true do |t|
    t.string   "name"
    t.text     "briefing"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "quiz_id"
  end

  create_table "case_studies_dockets", :id => false, :force => true do |t|
    t.integer "case_study_id"
    t.integer "docket_id"
  end

  create_table "case_studies_documents", :id => false, :force => true do |t|
    t.integer "case_study_id"
    t.integer "document_id"
  end

  create_table "case_studies_products", :id => false, :force => true do |t|
    t.integer "case_study_id"
    t.integer "product_id"
  end

  create_table "case_studies_tags", :id => false, :force => true do |t|
    t.integer "case_study_id"
    t.integer "tag_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "component_specs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "component_type_id"
  end

  create_table "component_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "common"
  end

  create_table "concepts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "concepts_products", :id => false, :force => true do |t|
    t.integer "concept_id"
    t.integer "product_id"
  end

  create_table "dockets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "super_set_id"
  end

  create_table "dockets_documents", :force => true do |t|
    t.integer "docket_id"
    t.integer "document_id"
    t.boolean "reference_document", :default => false
  end

  create_table "dockets_products", :id => false, :force => true do |t|
    t.integer "docket_id"
    t.integer "product_id"
  end

  create_table "dockets_reference_sets", :id => false, :force => true do |t|
    t.integer "docket_id"
    t.integer "reference_set_id"
  end

  create_table "docuchecks", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "document_id"
    t.integer  "reference_set_id"
    t.integer  "score"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "played",           :default => false
    t.integer  "docket_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "examples", :force => true do |t|
    t.integer  "component_id"
    t.integer  "reference_set_id"
    t.string   "example_image_file_name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.boolean  "is_image"
    t.string   "text_content"
  end

  create_table "filled_sections", :force => true do |t|
    t.integer  "docucheck_id"
    t.integer  "blank_section_id"
    t.integer  "example_id"
    t.boolean  "has_no_error"
    t.boolean  "answer_marked"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer  "document_id"
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "sample_file_name"
    t.string   "blank_form_file_name"
    t.integer  "line_height"
    t.integer  "sequence_number"
  end

  create_table "practice_filled_sections", :force => true do |t|
    t.integer  "filled_section_id"
    t.boolean  "answer_given"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "concept_id"
    t.integer  "docket_id"
    t.text     "statement"
    t.string   "optiona"
    t.string   "optionb"
    t.string   "optionc"
    t.string   "optiond"
    t.boolean  "optionacorrect"
    t.boolean  "optionbcorrect"
    t.boolean  "optionccorrect"
    t.boolean  "optiondcorrect"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "quiz_questions", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.boolean  "optiona"
    t.boolean  "optionb"
    t.boolean  "optionc"
    t.boolean  "optiond"
    t.boolean  "marked_correctly"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "quizzes", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "qcount"
    t.integer  "score"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "played",        :default => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "reference_sets", :force => true do |t|
    t.string   "name"
    t.integer  "super_set_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "correct"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "slide_images", :force => true do |t|
    t.string   "side_image_file_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "avatar_file_name"
  end

  create_table "slides", :force => true do |t|
    t.integer  "concept_id"
    t.text     "html_block"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "super_sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
