class AddGrandhamIdToAuthor < ActiveRecord::Migration[4.2]
  def change
    add_column :authors, :grandham_id, :string
  end
end
