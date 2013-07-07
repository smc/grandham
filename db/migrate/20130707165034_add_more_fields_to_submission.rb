class AddMoreFieldsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :description, :text
    add_column :submissions, :edition, :string
  end
end