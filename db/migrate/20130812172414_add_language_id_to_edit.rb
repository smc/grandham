class AddLanguageIdToEdit < ActiveRecord::Migration[4.2]
  def change
    add_column :edits, :language_id, :integer
  end
end
