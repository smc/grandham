class SubmissionsController < ApplicationController
  before_filter :set_book, only: [ :create ]
  before_filter :intialize_book, only: [ :new ]

  respond_to :html

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    respond_with @submission
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Your edit(s) will appear after moderation, thank you for your patience'

        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
        format.json { respond_with_bip(@submission) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@submission) }
      end
    end
  end

  def create
    @submission = @book.submissions.new(params[:submission])

    if @submission.save
      flash[:notice] = 'Your submission has been posted and has gone for moderation'
      redirect_to @redirect_path
    else
      @book.destroy if @new_book
      render action: "new"
    end
  end

  private

  def set_book
    if @book = current_book
      @new_book = false
      @redirect_path = book_path(@book)
    else
      @book = current_language.books.create
      @new_book = true
      @redirect_path = root_url
    end
  end

  def intialize_book
    if current_book
      @submission = Submission.initialize_with_data(current_book)
    else
      @submission = Submission.new
      @submission.authors.build
      @submission.publishers.build
    end
  end
end