class AddPlaceToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :place, :text
  end
end
