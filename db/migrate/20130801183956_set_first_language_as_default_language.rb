class SetFirstLanguageAsDefaultLanguage < ActiveRecord::Migration
  def up
    Language.first.update_attribute :default, true
  end
end
