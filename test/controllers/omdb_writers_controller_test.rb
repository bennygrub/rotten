require 'test_helper'

class OmdbWritersControllerTest < ActionController::TestCase
  setup do
    @omdb_writer = omdb_writers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omdb_writers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omdb_writer" do
    assert_difference('OmdbWriter.count') do
      post :create, omdb_writer: { omdb_movie_id: @omdb_writer.omdb_movie_id, role: @omdb_writer.role, writer_id: @omdb_writer.writer_id }
    end

    assert_redirected_to omdb_writer_path(assigns(:omdb_writer))
  end

  test "should show omdb_writer" do
    get :show, id: @omdb_writer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omdb_writer
    assert_response :success
  end

  test "should update omdb_writer" do
    patch :update, id: @omdb_writer, omdb_writer: { omdb_movie_id: @omdb_writer.omdb_movie_id, role: @omdb_writer.role, writer_id: @omdb_writer.writer_id }
    assert_redirected_to omdb_writer_path(assigns(:omdb_writer))
  end

  test "should destroy omdb_writer" do
    assert_difference('OmdbWriter.count', -1) do
      delete :destroy, id: @omdb_writer
    end

    assert_redirected_to omdb_writers_path
  end
end
