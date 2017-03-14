class Image < ApplicationRecord
  has_many :pictures
  has_many :users, through: :pictures
end
