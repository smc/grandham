class AddLanguageIdToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :language_id, :integer
  end
end
