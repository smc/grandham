class AddLanguageIdToAuthor < ActiveRecord::Migration[4.2]
  def change
    add_column :authors, :language_id, :integer
  end
end
