# frozen_string_literal: true

module QrGeneratorHelper
  def qr_for(object)
    param = "#{object.class}_#{object.grandham_id}"

    qr_generator_image_path(object: param, format: 'jpeg')
  end
end
