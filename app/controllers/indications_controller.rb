class IndicationsController < ApplicationController
  before_action  :set_indication, only: [:show, :edit, :update, :destroy]

  # GET /indications
  # GET /indications.json
  def index
    @indications = Indication.where("user_indicated_id = ?" , session[:user_id]).order("id DESC")
  end

  # GET /indications/1
  # GET /indications/1.json
  def show
  end

  # GET /indications/new
  def new
    @indication = Indication.new
  end

  # GET /indications/1/edit
  def edit
  end

  # POST /indications
  # POST /indications.json
  def create

    movie_ontroller = MoviesController.new
    imdb = params[:indication][:imdb]
    movie = movie_ontroller.find_movie_id(imdb)
    if movie
      params[:indication][:movie_id] ||= movie.id
    end
    @indication = Indication.new(indication_params)

    respond_to do |format|
      if @indication.save
        format.html { redirect_to @indication, notice: 'Parabéns pela Indicação!' }
        format.json { render :show, status: :created, location: @indication }
      else
        format.html { render :new }
        format.json { render json: @indication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indications/1
  # PATCH/PUT /indications/1.json
  def update
    respond_to do |format|
      if @indication.update(indication_params)
        format.html { redirect_to @indication, notice: 'Parabéns pela Indicação!' }
        format.json { render :show, status: :ok, location: @indication }
      else
        format.html { render :edit }
        format.json { render json: @indication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indications/1
  # DELETE /indications/1.json
  def destroy
    @indication.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Indicação excluída com Sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indication
      @indication = Indication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indication_params
      params.require(:indication).permit(:id, :user_indicator_id, :user_indicated_id, :movie_id, :plataform_id)
    end
end
