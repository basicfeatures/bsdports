class Category < ApplicationRecord
  belongs_to :os

  has_many :ports, dependent: :destroy

  extend FriendlyId
  friendly_id :name
end
