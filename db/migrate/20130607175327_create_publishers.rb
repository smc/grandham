class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.text :name

      t.timestamps
    end
  end
end
