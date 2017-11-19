class CreateAvailabilities < ActiveRecord::Migration[4.2]
  def change
    create_table :availabilities do |t|
      t.integer :library_id
      t.integer :book_id

      t.timestamps
    end
  end
end
