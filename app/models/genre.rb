class Genre < ApplicationRecord

  validates :name, presence: true
  validates :genre_type, presence: true

  has_many :movie_genres
  has_many :movies, through: :movie_genres
end