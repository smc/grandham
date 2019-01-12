# frozen_string_literal: true

class Api::V1::PublishersController < ApiBaseController
  before_action :set_publisher, only: :show
  before_action :parse_json_api_params

  def show
    render json: PublisherSerializer.new(@publisher)
  end

  def index
    render json: PublisherSerializer.new(
      Publisher.paginate(page: @query.page_number, per_page: @query.per_page)
    )
  end

  private

  def set_publisher
    @publisher = Publisher.find_by!(grandham_id: params[:id])
  end
end
