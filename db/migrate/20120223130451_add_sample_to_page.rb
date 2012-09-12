class AddSampleToPage < ActiveRecord::Migration
  def change
    add_column :pages, :sample_file_name, :string
    add_column :pages, :blank_form_file_name, :string
  end
end
