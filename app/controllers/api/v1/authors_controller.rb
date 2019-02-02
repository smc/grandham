# frozen_string_literal: true

class Api::V1::AuthorsController < ApiBaseController
  before_action :set_author, only: :show
  before_action :parse_json_api_params

  def show
    render json: AuthorSerializer.new(@author)
  end

  def index
    render json: AuthorSerializer.new(
      Author.paginate(page: @query.page_number, per_page: @query.per_page)
    )
  end

  private

  def set_author
    @author = Author.find_by!(grandham_id: params[:id])
  end
end
