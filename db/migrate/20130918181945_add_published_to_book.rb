class AddPublishedToBook < ActiveRecord::Migration[4.2]
  def change
    add_column :books, :published, :boolean, default: true
  end
end
