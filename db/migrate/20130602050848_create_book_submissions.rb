class CreateBookSubmissions < ActiveRecord::Migration
  def change
    create_table :book_submissions do |t|
      t.integer :book_id

      t.timestamps
    end
  end
end
