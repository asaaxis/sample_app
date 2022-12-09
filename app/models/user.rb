class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assigns
  has_many :teams, foreign_key: :owner_id, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns, source: :team, dependent: :destroy
  has_many :gears
  has_many :comments, dependent: :destroy
end
