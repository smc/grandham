class AddGrandhamIdForExisitingPublishers < ActiveRecord::Migration[4.2]
  def up
    Publisher.all.each do |publisher|
      unless publisher.grandham_id
        publisher.grandham_id = SecureRandom.hex(4)
        publisher.save
      end
    end
  end
end
