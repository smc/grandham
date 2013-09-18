class AddPublisherIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :publisher_id, :integer
  end
end
