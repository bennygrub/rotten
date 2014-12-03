class OmdbDirectorsController < ApplicationController
  before_action :set_omdb_director, only: [:show, :edit, :update, :destroy]

  # GET /omdb_directors
  # GET /omdb_directors.json
  def index
    @omdb_directors = OmdbDirector.all
  end

  # GET /omdb_directors/1
  # GET /omdb_directors/1.json
  def show
  end

  # GET /omdb_directors/new
  def new
    @omdb_director = OmdbDirector.new
  end

  # GET /omdb_directors/1/edit
  def edit
  end

  # POST /omdb_directors
  # POST /omdb_directors.json
  def create
    @omdb_director = OmdbDirector.new(omdb_director_params)

    respond_to do |format|
      if @omdb_director.save
        format.html { redirect_to @omdb_director, notice: 'Omdb director was successfully created.' }
        format.json { render action: 'show', status: :created, location: @omdb_director }
      else
        format.html { render action: 'new' }
        format.json { render json: @omdb_director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omdb_directors/1
  # PATCH/PUT /omdb_directors/1.json
  def update
    respond_to do |format|
      if @omdb_director.update(omdb_director_params)
        format.html { redirect_to @omdb_director, notice: 'Omdb director was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @omdb_director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omdb_directors/1
  # DELETE /omdb_directors/1.json
  def destroy
    @omdb_director.destroy
    respond_to do |format|
      format.html { redirect_to omdb_directors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omdb_director
      @omdb_director = OmdbDirector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omdb_director_params
      params.require(:omdb_director).permit(:director_id, :omdb_movie_id)
    end
end
