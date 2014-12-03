require 'test_helper'

class OmdbActorsControllerTest < ActionController::TestCase
  setup do
    @omdb_actor = omdb_actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omdb_actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omdb_actor" do
    assert_difference('OmdbActor.count') do
      post :create, omdb_actor: { actor_id: @omdb_actor.actor_id, omdb_movie_id: @omdb_actor.omdb_movie_id }
    end

    assert_redirected_to omdb_actor_path(assigns(:omdb_actor))
  end

  test "should show omdb_actor" do
    get :show, id: @omdb_actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omdb_actor
    assert_response :success
  end

  test "should update omdb_actor" do
    patch :update, id: @omdb_actor, omdb_actor: { actor_id: @omdb_actor.actor_id, omdb_movie_id: @omdb_actor.omdb_movie_id }
    assert_redirected_to omdb_actor_path(assigns(:omdb_actor))
  end

  test "should destroy omdb_actor" do
    assert_difference('OmdbActor.count', -1) do
      delete :destroy, id: @omdb_actor
    end

    assert_redirected_to omdb_actors_path
  end
end
