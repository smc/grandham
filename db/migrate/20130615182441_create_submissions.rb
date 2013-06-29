class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :book_id
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
