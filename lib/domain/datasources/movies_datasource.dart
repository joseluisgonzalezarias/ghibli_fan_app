import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';

abstract class MoviesDatasource {
  Future<List<MovieEntity>> getMovies();
}
