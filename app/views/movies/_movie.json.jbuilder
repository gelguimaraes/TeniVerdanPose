json.extract! movie, :id, :id, :titulo, :imdb, :created_at, :updated_at
json.url movie_url(movie, format: :json)
