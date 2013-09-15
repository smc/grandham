class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.text :name
      t.string :grandham_id
      t.integer :language_id

      t.timestamps
    end
  end
end
