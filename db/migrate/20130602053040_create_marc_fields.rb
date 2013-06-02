class CreateMarcFields < ActiveRecord::Migration
  def change
    create_table :marc_fields do |t|
      t.text :name

      t.timestamps
    end
  end
end
