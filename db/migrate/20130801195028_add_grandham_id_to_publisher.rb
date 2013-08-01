class AddGrandhamIdToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :grandham_id, :string
  end
end
