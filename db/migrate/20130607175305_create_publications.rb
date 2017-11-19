class CreatePublications < ActiveRecord::Migration[4.2]
  def change
    create_table :publications do |t|
      t.integer :publisher_id
      t.integer :book_id

      t.timestamps
    end
  end
end
