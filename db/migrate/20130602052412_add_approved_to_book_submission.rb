class AddApprovedToBookSubmission < ActiveRecord::Migration
  def change
    add_column :book_submissions, :approved, :boolean
  end
end
