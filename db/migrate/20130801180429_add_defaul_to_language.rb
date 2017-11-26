class AddDefaulToLanguage < ActiveRecord::Migration[4.2]
  def change
    add_column :languages, :default, :boolean, default: false
  end
end
