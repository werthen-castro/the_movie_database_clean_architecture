import 'package:get_it/get_it.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_client.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_client_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/repositories/get_movie_repository_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_genre_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_id_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/search_movie_use_case.dart';

class Injector {
  static GetIt getIt = GetIt.instance;

  static void init() async {
    // client rest
    getIt.registerLazySingleton<DioClient>(() => DioClientImpl());

    // Remote datasources
    getIt.registerFactory<GetMoviesDataSource>(
        () => GetMoviesDataSourceImpl(getIt.get<DioClient>()));

    // Repository
    getIt.registerFactory<GetMovieRepository>(
        () => GetMovieRepositoryImpl(getIt.get<GetMoviesDataSource>()));

    // Usecases
    getIt.registerLazySingleton(
        () => GetMovieForGenreUseCase(getIt.get<GetMovieRepository>()));

    getIt.registerLazySingleton(
        () => GetMovieForIdUseCase(getIt.get<GetMovieRepository>()));

    getIt.registerLazySingleton(
        () => SearchMovieUseCase(getIt.get<GetMovieRepository>()));
  }
}
