class Port < ApplicationRecord
  belongs_to :os
  belongs_to :category

  extend FriendlyId
  friendly_id :name
end
