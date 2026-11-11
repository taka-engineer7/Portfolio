class Cafe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_one_attached :image

  validates :name, presence: true
  validates :description, length: { maximum: 80 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  validates :business_hours, presence: true
end
