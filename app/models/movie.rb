class Movie < ApplicationRecord

  validates :name, presence: true

  has_many :movie_creators
  has_many :movie_genres
  has_many :creators, through: :movie_creators
  has_many :genres, through: :movie_genres
end