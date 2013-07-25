class AddGrandhamIdToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :grandham_id, :string
  end
end
