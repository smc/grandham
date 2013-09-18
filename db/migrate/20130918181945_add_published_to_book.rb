class AddPublishedToBook < ActiveRecord::Migration
  def change
    add_column :books, :published, :boolean, default: true
  end
end
