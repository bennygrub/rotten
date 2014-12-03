class OmdbGenresController < ApplicationController
  before_action :set_omdb_genre, only: [:show, :edit, :update, :destroy]

  # GET /omdb_genres
  # GET /omdb_genres.json
  def index
    @omdb_genres = OmdbGenre.all
  end

  # GET /omdb_genres/1
  # GET /omdb_genres/1.json
  def show
  end

  # GET /omdb_genres/new
  def new
    @omdb_genre = OmdbGenre.new
  end

  # GET /omdb_genres/1/edit
  def edit
  end

  # POST /omdb_genres
  # POST /omdb_genres.json
  def create
    @omdb_genre = OmdbGenre.new(omdb_genre_params)

    respond_to do |format|
      if @omdb_genre.save
        format.html { redirect_to @omdb_genre, notice: 'Omdb genre was successfully created.' }
        format.json { render action: 'show', status: :created, location: @omdb_genre }
      else
        format.html { render action: 'new' }
        format.json { render json: @omdb_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omdb_genres/1
  # PATCH/PUT /omdb_genres/1.json
  def update
    respond_to do |format|
      if @omdb_genre.update(omdb_genre_params)
        format.html { redirect_to @omdb_genre, notice: 'Omdb genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @omdb_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omdb_genres/1
  # DELETE /omdb_genres/1.json
  def destroy
    @omdb_genre.destroy
    respond_to do |format|
      format.html { redirect_to omdb_genres_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omdb_genre
      @omdb_genre = OmdbGenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omdb_genre_params
      params.require(:omdb_genre).permit(:genre_id, :omdb_movie_id)
    end
end
