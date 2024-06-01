import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getMovies();
}
