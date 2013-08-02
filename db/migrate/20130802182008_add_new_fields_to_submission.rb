class AddNewFieldsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :ddc, :string
    add_column :submissions, :volume, :string
    add_column :submissions, :series, :string
    add_column :submissions, :price, :string
    add_column :submissions, :length, :string
    add_column :submissions, :title_orginal, :text
    add_column :submissions, :illustrator, :text
    add_column :submissions, :note, :text
  end
end