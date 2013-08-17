class AddBookIdToEdit < ActiveRecord::Migration
  def change
    add_column :edits, :book_id, :integer
  end
end
