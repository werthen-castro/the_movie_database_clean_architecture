import 'package:the_movie_database_clean_arch/core/dio_client/dio_client.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_response.dart';
import 'package:the_movie_database_clean_arch/core/erros/custom_server_exceptions.dart';
import 'package:the_movie_database_clean_arch/core/utils/movie_endpoints.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/details_movie_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';

import 'get_movies_data_source.dart';

class GetMoviesDataSourceImpl implements GetMoviesDataSource {
  final DioClient _dioClient;

  GetMoviesDataSourceImpl(this._dioClient);
  @override
  Future<List<MovieModel>> getMovies(
      {required int page, required int genereId}) async {
    DioResponse response =
        await _dioClient.get(MovieEndpoints.movieForGenres(page, genereId));

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((model) => MovieModel.fromMap(model)));
    } else {
      return throw CustomServerException(
          messageError: response.statusMessage, timeout: response.timeout);
    }
  }

  @override
  Future<DetailsMovieModel> getMovieForId({required int id}) async {
    DioResponse response = await _dioClient.get(MovieEndpoints.movieForId(id));

    if (response.statusCode == 200) {
      return DetailsMovieModel.fromMap(response.data);
    } else {
      return throw CustomServerException(
          messageError: response.statusMessage, timeout: response.timeout);
    }
  }

  @override
  Future<List<MovieModel>> searchMovie(
      {required int page, required String name}) async {
    DioResponse response =
        await _dioClient.get(MovieEndpoints.searchMovie(name, page));

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((model) => MovieModel.fromMap(model)));
    } else {
      return throw CustomServerException(
          messageError: response.statusMessage, timeout: response.timeout);
    }
  }
}
