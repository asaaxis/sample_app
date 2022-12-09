class TravelPlan < ApplicationRecord
  validates :name, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :team
end
