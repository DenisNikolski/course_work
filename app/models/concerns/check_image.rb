module CheckImage
  private

  def check_img
    unless File.exist?(Rails.root.join('app/assets/images', img_src))
      errors.add(:img_src, ':there is no such image')
    end
  end
end