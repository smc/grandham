class AddDefaulToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :default, :boolean, default: false
  end
end
