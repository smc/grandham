class AddFieldsToBook < ActiveRecord::Migration
  def change
    add_column :books, :title, :text
    add_column :books, :isbn, :string
    add_column :books, :pages, :string
    add_column :books, :year, :string
    add_column :books, :description, :text
    add_column :books, :edition, :string
    add_column :books, :ddc, :string
    add_column :books, :volume, :string
    add_column :books, :series, :string
    add_column :books, :price, :string
    add_column :books, :length, :string
    add_column :books, :title_orginal, :text
    add_column :books, :illustrator, :text
    add_column :books, :note, :text
  end
end
