class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.string :field
      t.text :old_value
      t.text :new_value
      t.integer :user_id
      t.references :editable, polymorphic: true
      t.string :state, default: 'open'
      t.integer :reviewed_by_user_id

      t.timestamps
    end
  end
end
