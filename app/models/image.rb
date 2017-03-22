class Image < ApplicationRecord
  has_many :pictures, dependent: :destroy, inverse_of: :image
  has_many :users, through: :pictures

  validates_presence_of :name, :tags, :photo, :price, :users

  # This method associates the attribute ":photo" with a file attachment
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :to_shop,
    -> (user) { joins(:pictures).
                where("pictures.user_id != ?", user.id).
                where("pictures.image_id not in (?)", user.images.ids) }

  scope :my_images,
    -> (user) { joins(:pictures).
                where("pictures.user_id = ?", user.id) }
end
