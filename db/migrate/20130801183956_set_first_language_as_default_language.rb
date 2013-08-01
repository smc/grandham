class SetFirstLanguageAsDefaultLanguage < ActiveRecord::Migration
  def up
    if language = Language.first
      language.update_attribute :default, true
    end
  end
end
