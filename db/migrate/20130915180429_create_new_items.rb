class CreateNewItems < ActiveRecord::Migration[4.2]
  def change
    create_table :new_items do |t|
      t.integer :reviewed_by_user_id
      t.string :state, default: 'open'
      t.integer :user_id
      t.integer :language_id
      t.references :creatable, polymorphic: true

      t.timestamps
    end
  end
end
