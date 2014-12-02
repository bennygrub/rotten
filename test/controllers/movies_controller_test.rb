require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { audience_rating: @movie.audience_rating, audience_score: @movie.audience_score, cast_url: @movie.cast_url, critics_consensus: @movie.critics_consensus, critics_rating: @movie.critics_rating, critics_score: @movie.critics_score, imdb: @movie.imdb, mpaa_rating: @movie.mpaa_rating, poster_url: @movie.poster_url, release_dvd: @movie.release_dvd, release_theater: @movie.release_theater, review_url: @movie.review_url, rt_id: @movie.rt_id, rt_url: @movie.rt_url, runtime: @movie.runtime, similar_url: @movie.similar_url, synopsis: @movie.synopsis, title: @movie.title, year: @movie.year }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { audience_rating: @movie.audience_rating, audience_score: @movie.audience_score, cast_url: @movie.cast_url, critics_consensus: @movie.critics_consensus, critics_rating: @movie.critics_rating, critics_score: @movie.critics_score, imdb: @movie.imdb, mpaa_rating: @movie.mpaa_rating, poster_url: @movie.poster_url, release_dvd: @movie.release_dvd, release_theater: @movie.release_theater, review_url: @movie.review_url, rt_id: @movie.rt_id, rt_url: @movie.rt_url, runtime: @movie.runtime, similar_url: @movie.similar_url, synopsis: @movie.synopsis, title: @movie.title, year: @movie.year }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end
end
