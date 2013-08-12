class AddLanguageIdToEdit < ActiveRecord::Migration
  def change
    add_column :edits, :language_id, :integer
  end
end
