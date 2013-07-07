class AddLanguageIdToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :language_id, :integer
  end
end
