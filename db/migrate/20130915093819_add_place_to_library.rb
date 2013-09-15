class AddPlaceToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :place, :text
  end
end
