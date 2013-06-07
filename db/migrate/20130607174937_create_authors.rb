class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :name

      t.timestamps
    end
  end
end
