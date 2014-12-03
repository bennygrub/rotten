require 'test_helper'

class OmdbDirectorsControllerTest < ActionController::TestCase
  setup do
    @omdb_director = omdb_directors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omdb_directors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omdb_director" do
    assert_difference('OmdbDirector.count') do
      post :create, omdb_director: { director_id: @omdb_director.director_id, omdb_movie_id: @omdb_director.omdb_movie_id }
    end

    assert_redirected_to omdb_director_path(assigns(:omdb_director))
  end

  test "should show omdb_director" do
    get :show, id: @omdb_director
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omdb_director
    assert_response :success
  end

  test "should update omdb_director" do
    patch :update, id: @omdb_director, omdb_director: { director_id: @omdb_director.director_id, omdb_movie_id: @omdb_director.omdb_movie_id }
    assert_redirected_to omdb_director_path(assigns(:omdb_director))
  end

  test "should destroy omdb_director" do
    assert_difference('OmdbDirector.count', -1) do
      delete :destroy, id: @omdb_director
    end

    assert_redirected_to omdb_directors_path
  end
end
