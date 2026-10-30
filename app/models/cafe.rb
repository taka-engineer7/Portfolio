class Cafe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_one_attached :image
end
