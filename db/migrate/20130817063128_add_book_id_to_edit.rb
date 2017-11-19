class AddBookIdToEdit < ActiveRecord::Migration[4.2]
  def change
    add_column :edits, :book_id, :integer
  end
end
