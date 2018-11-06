# frozen_string_literal: true

class QrGeneratorController < ApplicationController
  def image
    url = url_for_object(params[:object])

    respond_to do |format|
      format.html
      format.svg  { render qrcode: url, level: :l, unit: 10 }
      format.png  { render qrcode: url }
      format.gif  { render qrcode: url }
      format.jpeg { render qrcode: url }
    end
  end

  private

  def url_for_object(object_identifier)
    type, grandham_id = object_identifier.split("_")
    object = type.constantize.where(grandham_id: grandham_id).first

    url_for([object.language, object])
  end
end
