class AddTypeToPicture < ActiveRecord::Migration[4.2]
  def change
    add_column :pictures, :type, :string
  end
end
