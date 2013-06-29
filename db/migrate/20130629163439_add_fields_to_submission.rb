class AddFieldsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :title, :text
    add_column :submissions, :isbn, :string
    add_column :submissions, :pages, :string
    add_column :submissions, :year, :string
  end
end
