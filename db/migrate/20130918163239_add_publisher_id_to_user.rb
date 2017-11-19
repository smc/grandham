class AddPublisherIdToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :publisher_id, :integer
  end
end
