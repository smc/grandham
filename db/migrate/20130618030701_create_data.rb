class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :field_id
      t.string :value
      t.integer :submission_id

      t.timestamps
    end
  end
end
