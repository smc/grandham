class AddApprovedToBook < ActiveRecord::Migration[4.2]
  def change
    add_column :books, :approved, :boolean
  end
end
