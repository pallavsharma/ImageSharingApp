class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :album
  validate :max_photos

  def max_photos
    errors.add(:photos, "too much") if album.photos.length > 3
  end
end
