import 'package:ghibli_fan_app/domain/datasources/movies_datasource.dart';
import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';
import 'package:ghibli_fan_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MoviesRepositoryImpl({required this.moviesDatasource});
  @override
  Future<List<MovieEntity>> getMovies() {
    return moviesDatasource.getMovies();
  }
}
