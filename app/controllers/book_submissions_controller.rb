class BookSubmissionsController < ApplicationController
  # GET /book_submissions
  # GET /book_submissions.json
  def index
    @book_submissions = BookSubmission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_submissions }
    end
  end

  # GET /book_submissions/1
  # GET /book_submissions/1.json
  def show
    @book_submission = BookSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_submission }
    end
  end

  # GET /book_submissions/new
  # GET /book_submissions/new.json
  def new
    @book_submission = BookSubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_submission }
    end
  end

  # GET /book_submissions/1/edit
  def edit
    @book_submission = BookSubmission.find(params[:id])
  end

  # POST /book_submissions
  # POST /book_submissions.json
  def create
    @book_submission = BookSubmission.new(params[:book_submission])

    respond_to do |format|
      if @book_submission.save
        format.html { redirect_to @book_submission, notice: 'Book submission was successfully created.' }
        format.json { render json: @book_submission, status: :created, location: @book_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @book_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_submissions/1
  # PUT /book_submissions/1.json
  def update
    @book_submission = BookSubmission.find(params[:id])

    respond_to do |format|
      if @book_submission.update_attributes(params[:book_submission])
        format.html { redirect_to @book_submission, notice: 'Book submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_submissions/1
  # DELETE /book_submissions/1.json
  def destroy
    @book_submission = BookSubmission.find(params[:id])
    @book_submission.destroy

    respond_to do |format|
      format.html { redirect_to book_submissions_url }
      format.json { head :no_content }
    end
  end
end
