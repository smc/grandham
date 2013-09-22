module QrGeneratorHelper
  def qr_for(object)
    param = "#{object.class.to_s}_#{object.grandham_id}"

    qr_generator_image_path(object: param, format: 'jpeg')
  end
end
