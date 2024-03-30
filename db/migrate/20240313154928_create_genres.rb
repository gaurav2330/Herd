class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :genre_type
    end

    create_table :movie_genres do |t|
      t.belongs_to :movie
      t.belongs_to :genre
    end
  end
end
