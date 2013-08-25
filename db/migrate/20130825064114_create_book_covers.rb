class CreateBookCovers < ActiveRecord::Migration
  def change
    create_table :book_covers do |t|

      t.timestamps
    end
  end
end
