# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def seed_user_data
  csv_data = CSV.read('lib\assets\people-1000.csv', headers: true)
  users_array = []
  csv_data.each do |row|
    user_hash = {
      first_name: row['First Name'],
      last_name: row['Last Name'],
      sex: row['Sex'],
      email: row['Email'],
      phone_number: row['Phone'],
      date_of_birth: row['Date of birth']
    }
    users_array << user_hash
  end
  User.create(users_array)
end
9798507715

def seed_movie_data
  csv_data = CSV.read('lib\assets\movies.csv', headers: true)
  csv_data.each do |row|
    next unless row['Name'].present?
    Movie.count

    movie_details = {
      name: row['Name'],
      year: row['Year']&.split('-')&[1],
      rating: row['Rating'],
      votes: row['Votes'],
      duration: row['Duration']&.split(' ')&[0]
    }
    movie = Movie.create(movie_details)

    director = Creator.where(name: row['Director'], creator_type: 'director')
    movie.creators << director

    actors = Creator.where(name: [row['Actor 1'], row['Actor 2'], row['Actor 3']], creator_type: 'actor')
    movie.creators << actors

    next unless row['Genre'].present?

    genre_data = row['Genre'].gsub(' ', '').split(',')
    genres = Genre.where(name: genre_data)
    movie.genres << genres
  end
end

def seed_movie_genre_data
  csv_data = CSV.read('lib\assets\movies.csv', headers: true)
  genre_array = []
  csv_data.each do |row|
    next unless row['Genre'].present?

    row['Genre'].split(',').each do |genre|
      genre_array << {
        name: genre.strip,
        genre_type: 'movie'
      }
    end
  end
  Genre.create(genre_array.uniq)
end

def seed_movie_creator_data
  csv_data = CSV.read('lib\assets\movies.csv', headers: true)
  director_array = []
  actor_array = []
  csv_data.each do |row|
    director_array << {
      name: row['Director'],
      creator_type: 'director'
    }

    actor_array << {
      name: row['Actor 1'],
      creator_type: 'actor'
    }
    actor_array << {
      name: row['Actor 2'],
      creator_type: 'actor'
    }
    actor_array << {
      name: row['Actor 3'],
      creator_type: 'actor'
    }
  end
  Creator.create(director_array.uniq)
  Creator.create(actor_array.uniq)
end

def seed_book_data
end


# seed_user_data()
# seed_movie_genre_data()
# seed_movie_creator_data()
seed_movie_data()
# seed_book_data()
