class AddLibraryIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :library_id, :integer
  end
end
