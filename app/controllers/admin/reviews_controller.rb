class Admin::ReviewsController < AdminController
  def index
    @submissions = current_language.submissions.not_reviewed.first(20)
  end

  def show
    @submission = Submission.find(params[:id])
  end
end