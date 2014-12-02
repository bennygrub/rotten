class ArtistMoviesController < ApplicationController
  before_action :set_artist_movie, only: [:show, :edit, :update, :destroy]

  # GET /artist_movies
  # GET /artist_movies.json
  def index
    @artist_movies = ArtistMovie.all
  end

  # GET /artist_movies/1
  # GET /artist_movies/1.json
  def show
  end

  # GET /artist_movies/new
  def new
    @artist_movie = ArtistMovie.new
  end

  # GET /artist_movies/1/edit
  def edit
  end

  # POST /artist_movies
  # POST /artist_movies.json
  def create
    @artist_movie = ArtistMovie.new(artist_movie_params)

    respond_to do |format|
      if @artist_movie.save
        format.html { redirect_to @artist_movie, notice: 'Artist movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artist_movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_movies/1
  # PATCH/PUT /artist_movies/1.json
  def update
    respond_to do |format|
      if @artist_movie.update(artist_movie_params)
        format.html { redirect_to @artist_movie, notice: 'Artist movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_movies/1
  # DELETE /artist_movies/1.json
  def destroy
    @artist_movie.destroy
    respond_to do |format|
      format.html { redirect_to artist_movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_movie
      @artist_movie = ArtistMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_movie_params
      params.require(:artist_movie).permit(:artist_id, :movie_id)
    end
end
