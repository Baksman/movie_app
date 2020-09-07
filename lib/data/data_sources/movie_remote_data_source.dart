import 'package:movie_app/data/core/api_call.dart';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient _apiClient;
  MovieRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _apiClient.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _apiClient.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _apiClient.get("movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _apiClient.get("movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }
}
