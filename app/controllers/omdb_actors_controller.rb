class OmdbActorsController < ApplicationController
  before_action :set_omdb_actor, only: [:show, :edit, :update, :destroy]

  # GET /omdb_actors
  # GET /omdb_actors.json
  def index
    @omdb_actors = OmdbActor.all = Title.all if params[:chunk] == "all"
    @omdb_actors = OmdbActor.all.limit(10000) if params[:chunk] == 1
    if params[:chunk]
      if params[:chunk].to_i > 1
        off = (params[:chunk].to_i * 10000)
        @omdb_actors = OmdbActor.all.offset(off).limit(10000) if params[:chunk] == params[:chunk]
      end
    end
  end

  # GET /omdb_actors/1
  # GET /omdb_actors/1.json
  def show
  end

  # GET /omdb_actors/new
  def new
    @omdb_actor = OmdbActor.new
  end

  # GET /omdb_actors/1/edit
  def edit
  end

  # POST /omdb_actors
  # POST /omdb_actors.json
  def create
    @omdb_actor = OmdbActor.new(omdb_actor_params)

    respond_to do |format|
      if @omdb_actor.save
        format.html { redirect_to @omdb_actor, notice: 'Omdb actor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @omdb_actor }
      else
        format.html { render action: 'new' }
        format.json { render json: @omdb_actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omdb_actors/1
  # PATCH/PUT /omdb_actors/1.json
  def update
    respond_to do |format|
      if @omdb_actor.update(omdb_actor_params)
        format.html { redirect_to @omdb_actor, notice: 'Omdb actor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @omdb_actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omdb_actors/1
  # DELETE /omdb_actors/1.json
  def destroy
    @omdb_actor.destroy
    respond_to do |format|
      format.html { redirect_to omdb_actors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omdb_actor
      @omdb_actor = OmdbActor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omdb_actor_params
      params.require(:omdb_actor).permit(:actor_id, :omdb_movie_id)
    end
end
