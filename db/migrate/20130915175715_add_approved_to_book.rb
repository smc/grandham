class AddApprovedToBook < ActiveRecord::Migration
  def change
    add_column :books, :approved, :boolean, default: false
  end
end
