class Blog < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
