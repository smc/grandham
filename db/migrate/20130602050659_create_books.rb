class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :grandham_id
      t.integer :language_id

      t.timestamps
    end
  end
end
