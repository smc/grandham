class CreateMarcData < ActiveRecord::Migration
  def change
    create_table :marc_data do |t|
      t.text :field
      t.text :value
      t.integer :book_submission_id

      t.timestamps
    end
  end
end
