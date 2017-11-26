class CreatePublishers < ActiveRecord::Migration[4.2]
  def change
    create_table :publishers do |t|
      t.text :name

      t.timestamps
    end
  end
end
