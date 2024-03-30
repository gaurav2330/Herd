class CreateMovieCreatorTables < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.integer :duration
      t.float :rating
      t.integer :votes

      t.timestamps
    end

    create_table :creators do |t|
      t.string :name
      t.string :creator_type
    end

    create_table :movie_creators do |t|
      t.belongs_to :movie
      t.belongs_to :creator
    end
  end
end
