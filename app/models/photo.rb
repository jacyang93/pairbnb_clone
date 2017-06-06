class Photo < ApplicationRecord
  belongs_to :listing
	mount_uploader :image, PhotoUploader
end
