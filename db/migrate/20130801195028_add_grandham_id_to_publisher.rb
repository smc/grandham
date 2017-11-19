class AddGrandhamIdToPublisher < ActiveRecord::Migration[4.2]
  def change
    add_column :publishers, :grandham_id, :string
  end
end
