class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.text :name
      t.string :short_id

      t.timestamps
    end
  end
end
