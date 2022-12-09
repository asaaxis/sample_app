class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :blogs, through: :labellings
end
