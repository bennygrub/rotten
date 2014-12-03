class OmdbMoviesController < ApplicationController
  before_action :set_omdb_movie, only: [:show, :edit, :update, :destroy]

  # GET /omdb_movies
  # GET /omdb_movies.json
  def index
    @omdb_movies = OmdbMovie.all
  end

  # GET /omdb_movies/1
  # GET /omdb_movies/1.json
  def show
  end

  # GET /omdb_movies/new
  def new
    @omdb_movie = OmdbMovie.new
  end

  # GET /omdb_movies/1/edit
  def edit
  end

  # POST /omdb_movies
  # POST /omdb_movies.json
  def create
    @omdb_movie = OmdbMovie.new(omdb_movie_params)

    respond_to do |format|
      if @omdb_movie.save
        format.html { redirect_to @omdb_movie, notice: 'Omdb movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @omdb_movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @omdb_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omdb_movies/1
  # PATCH/PUT /omdb_movies/1.json
  def update
    respond_to do |format|
      if @omdb_movie.update(omdb_movie_params)
        format.html { redirect_to @omdb_movie, notice: 'Omdb movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @omdb_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omdb_movies/1
  # DELETE /omdb_movies/1.json
  def destroy
    @omdb_movie.destroy
    respond_to do |format|
      format.html { redirect_to omdb_movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omdb_movie
      @omdb_movie = OmdbMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omdb_movie_params
      params.require(:omdb_movie).permit(:imdb, :title, :year, :rated, :released, :runtime, :plot, :language, :country, :awards, :metascore, :imdb_rating, :imdb_votes)
    end
end
