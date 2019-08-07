class ImdbService
  def get_plot_by_title(title, year)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=a02f04d1&t=#{title}&plot=full&y=#{year}")
    response.parsed_response
  end
  def get_image_by_title(id_imdb)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=a02f04d1&i=#{id_imdb}&plot=full")
    parsed_response = JSON.parser(response)
    parsed_response["Poster"]
  end
end