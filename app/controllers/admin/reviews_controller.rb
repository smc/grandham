class Admin::ReviewsController < AdminController
  def show
    @submissions = current_language.submissions.not_reviewed.first(20)
  end
end