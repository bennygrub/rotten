require 'test_helper'

class OmdbGenresControllerTest < ActionController::TestCase
  setup do
    @omdb_genre = omdb_genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omdb_genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omdb_genre" do
    assert_difference('OmdbGenre.count') do
      post :create, omdb_genre: { genre_id: @omdb_genre.genre_id, omdb_movie_id: @omdb_genre.omdb_movie_id }
    end

    assert_redirected_to omdb_genre_path(assigns(:omdb_genre))
  end

  test "should show omdb_genre" do
    get :show, id: @omdb_genre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omdb_genre
    assert_response :success
  end

  test "should update omdb_genre" do
    patch :update, id: @omdb_genre, omdb_genre: { genre_id: @omdb_genre.genre_id, omdb_movie_id: @omdb_genre.omdb_movie_id }
    assert_redirected_to omdb_genre_path(assigns(:omdb_genre))
  end

  test "should destroy omdb_genre" do
    assert_difference('OmdbGenre.count', -1) do
      delete :destroy, id: @omdb_genre
    end

    assert_redirected_to omdb_genres_path
  end
end
