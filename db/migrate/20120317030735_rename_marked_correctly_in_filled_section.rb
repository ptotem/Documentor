class RenameMarkedCorrectlyInFilledSection < ActiveRecord::Migration
  def change

   rename_column :filled_sections,:marked_correctly,:answer_marked

  end

end
