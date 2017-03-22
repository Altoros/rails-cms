class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates_presence_of :user, :image
end
