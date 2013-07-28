class AddReviewedToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :reviewed, :boolean, default: false
  end
end
