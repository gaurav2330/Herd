class MovieCreator < ApplicationRecord
  
  belongs_to :movie
  belongs_to :creator
end