class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]


  def search
    imdbs = ImdbService.new
    objects = imdbs.get_plot_by_title("#{params[:busca]}", "#{params[:year]}")
    keys_to_extract = ["Title", "imdbID", "Year"]
    objects_filted = objects.select { |key,_| keys_to_extract.include? key }
    render json: [objects_filted]
  end

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.joins(:indications).where("user_indicator_id = ?" , session[:user_id]).order("id DESC")
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
    @movie
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:id, :titulo, :imdb, :poster, :ano, :nota, :genero)
    end

  public
  def find_movie_id(imdb)
      if imdb.present?
        movie = Movie.find_by_imdb(imdb)
        if movie
           @movie = movie
        else
          imdbs = ImdbService.new
          json = imdbs.get_plot_by_id(imdb)
          keys_to_extract = ["Title", "imdbID", "Poster", "Year", "Genre","imdbRating"]
          object = json.select { |key, value| keys_to_extract.include? key }
          jsonRatting = json.select { |key, value| ["Ratings"].include? key }

          (object["imdbRating"] == "N/A")? ratting = "Sem Nota" : ratting = object["imdbRating"] + "/10"
          #ratting = jsonRatting.map{|v| v[1][0].slice("Value")}[0]

          @movie = Movie.create(titulo: object["Title"], imdb: object["imdbID"],
                       poster: object["Poster"], ano: object["Year"], nota: ratting , genero: object["Genre"])
        end
      else
        @movie = nil
      end
  end
end
