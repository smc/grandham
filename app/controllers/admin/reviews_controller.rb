class Admin::ReviewsController < AdminController
  before_filter :find_submission, only: [ :show, :approve, :archive ]

  def index
    @submissions = current_language.submissions.not_reviewed.first(20)
  end

  def show
  end

  def approve
    @submission.set_approved!

    redirect_to_reviews_list
  end

  def archive
    @submission.set_reviewed!

    redirect_to_reviews_list
  end

  private

  def find_submission
    @submission = Submission.find(params[:id])
  end

  def redirect_to_reviews_list
    redirect_to language_admin_reviews_path(language_id: current_language)
  end
end