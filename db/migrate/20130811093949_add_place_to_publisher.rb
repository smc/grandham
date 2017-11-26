class AddPlaceToPublisher < ActiveRecord::Migration[4.2]
  def change
    add_column :publishers, :place, :text
  end
end
