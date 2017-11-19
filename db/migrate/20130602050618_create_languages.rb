class CreateLanguages < ActiveRecord::Migration[4.2]
  def change
    create_table :languages do |t|
      t.text :name
      t.string :short_code

      t.timestamps
    end
  end
end
