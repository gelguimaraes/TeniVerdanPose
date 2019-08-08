class ImdbService
  def get_plot_by_title(title, year)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=a02f04d1&t=#{title}&y=#{year}")
    response.parsed_response
  end
  def get_plot_by_id(id_imdb)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=a02f04d1&i=#{id_imdb}&plot=full")
    response.parsed_response
  end
end