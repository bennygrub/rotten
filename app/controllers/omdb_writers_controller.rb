class OmdbWritersController < ApplicationController
  before_action :set_omdb_writer, only: [:show, :edit, :update, :destroy]

  # GET /omdb_writers
  # GET /omdb_writers.json
  def index
    @omdb_writers = OmdbWriter.all
  end

  # GET /omdb_writers/1
  # GET /omdb_writers/1.json
  def show
  end

  # GET /omdb_writers/new
  def new
    @omdb_writer = OmdbWriter.new
  end

  # GET /omdb_writers/1/edit
  def edit
  end

  # POST /omdb_writers
  # POST /omdb_writers.json
  def create
    @omdb_writer = OmdbWriter.new(omdb_writer_params)

    respond_to do |format|
      if @omdb_writer.save
        format.html { redirect_to @omdb_writer, notice: 'Omdb writer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @omdb_writer }
      else
        format.html { render action: 'new' }
        format.json { render json: @omdb_writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omdb_writers/1
  # PATCH/PUT /omdb_writers/1.json
  def update
    respond_to do |format|
      if @omdb_writer.update(omdb_writer_params)
        format.html { redirect_to @omdb_writer, notice: 'Omdb writer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @omdb_writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omdb_writers/1
  # DELETE /omdb_writers/1.json
  def destroy
    @omdb_writer.destroy
    respond_to do |format|
      format.html { redirect_to omdb_writers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omdb_writer
      @omdb_writer = OmdbWriter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omdb_writer_params
      params.require(:omdb_writer).permit(:writer_id, :omdb_movie_id, :role)
    end
end
