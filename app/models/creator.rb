class Creator < ApplicationRecord

  validates :name, presence: true
  validates :creator_type, presence: true

  has_many :movie_creators
  has_many :movies, through: :movie_creators
end