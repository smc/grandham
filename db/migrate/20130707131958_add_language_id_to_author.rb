class AddLanguageIdToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :language_id, :integer
  end
end
