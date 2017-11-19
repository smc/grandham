class AddPlaceToLibrary < ActiveRecord::Migration[4.2]
  def change
    add_column :libraries, :place, :text
  end
end
