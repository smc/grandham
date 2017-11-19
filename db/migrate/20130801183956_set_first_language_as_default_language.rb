class SetFirstLanguageAsDefaultLanguage < ActiveRecord::Migration[4.2]
  def up
    if language = Language.first
      language.update_attribute :default, true
    end
  end
end
