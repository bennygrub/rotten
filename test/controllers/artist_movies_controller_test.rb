require 'test_helper'

class ArtistMoviesControllerTest < ActionController::TestCase
  setup do
    @artist_movie = artist_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artist_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist_movie" do
    assert_difference('ArtistMovie.count') do
      post :create, artist_movie: { artist_id: @artist_movie.artist_id, movie_id: @artist_movie.movie_id }
    end

    assert_redirected_to artist_movie_path(assigns(:artist_movie))
  end

  test "should show artist_movie" do
    get :show, id: @artist_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist_movie
    assert_response :success
  end

  test "should update artist_movie" do
    patch :update, id: @artist_movie, artist_movie: { artist_id: @artist_movie.artist_id, movie_id: @artist_movie.movie_id }
    assert_redirected_to artist_movie_path(assigns(:artist_movie))
  end

  test "should destroy artist_movie" do
    assert_difference('ArtistMovie.count', -1) do
      delete :destroy, id: @artist_movie
    end

    assert_redirected_to artist_movies_path
  end
end
