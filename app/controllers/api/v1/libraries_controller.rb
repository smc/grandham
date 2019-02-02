# frozen_string_literal: true

class Api::V1::LibrariesController < ApiBaseController
  before_action :set_library, only: :show
  before_action :parse_json_api_params

  def show
    render json: LibrarySerializer.new(@library)
  end

  def index
    @libraries = if @query.search_query.present?
                   Library.search(@query.search_query, page: @query.page_number, per_page: @query.per_page)
                 else
                   Library.paginate(page: @query.page_number, per_page: @query.per_page)
                 end

    render json: LibrarySerializer.new(@libraries)
  end

  private

  def set_library
    @ibrary = Library.find_by!(grandham_id: params[:id])
  end
end
