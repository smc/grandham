class AddBookIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :book_id, :integer
  end
end
