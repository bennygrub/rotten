require 'test_helper'

class OmdbMoviesControllerTest < ActionController::TestCase
  setup do
    @omdb_movie = omdb_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omdb_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omdb_movie" do
    assert_difference('OmdbMovie.count') do
      post :create, omdb_movie: { awards: @omdb_movie.awards, country: @omdb_movie.country, imdb: @omdb_movie.imdb, imdb_rating: @omdb_movie.imdb_rating, imdb_votes: @omdb_movie.imdb_votes, language: @omdb_movie.language, metascore: @omdb_movie.metascore, plot: @omdb_movie.plot, rated: @omdb_movie.rated, released: @omdb_movie.released, runtime: @omdb_movie.runtime, title: @omdb_movie.title, year: @omdb_movie.year }
    end

    assert_redirected_to omdb_movie_path(assigns(:omdb_movie))
  end

  test "should show omdb_movie" do
    get :show, id: @omdb_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omdb_movie
    assert_response :success
  end

  test "should update omdb_movie" do
    patch :update, id: @omdb_movie, omdb_movie: { awards: @omdb_movie.awards, country: @omdb_movie.country, imdb: @omdb_movie.imdb, imdb_rating: @omdb_movie.imdb_rating, imdb_votes: @omdb_movie.imdb_votes, language: @omdb_movie.language, metascore: @omdb_movie.metascore, plot: @omdb_movie.plot, rated: @omdb_movie.rated, released: @omdb_movie.released, runtime: @omdb_movie.runtime, title: @omdb_movie.title, year: @omdb_movie.year }
    assert_redirected_to omdb_movie_path(assigns(:omdb_movie))
  end

  test "should destroy omdb_movie" do
    assert_difference('OmdbMovie.count', -1) do
      delete :destroy, id: @omdb_movie
    end

    assert_redirected_to omdb_movies_path
  end
end
