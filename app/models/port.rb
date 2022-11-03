class Port < ApplicationRecord
  belongs_to :category
  belongs_to :os
end
