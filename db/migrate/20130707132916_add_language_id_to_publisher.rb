class AddLanguageIdToPublisher < ActiveRecord::Migration[4.2]
  def change
    add_column :publishers, :language_id, :integer
  end
end
