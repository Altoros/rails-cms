class Image < ApplicationRecord
  has_many :pictures
  has_many :users, through: :pictures

  # This method associates the attribute ":photo" with a file attachment
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
