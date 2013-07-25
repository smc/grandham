class AddGrandhamIdToAuthorIfMissing < ActiveRecord::Migration
  def up
    Author.where(grandham_id: nil).each{ |author| author.update_attribute(:grandham_id, SecureRandom.hex(4)) }
  end
end
