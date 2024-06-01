import 'package:dio/dio.dart';
import 'package:ghibli_fan_app/domain/datasources/movies_datasource.dart';
import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';
import 'package:ghibli_fan_app/infrastructure/mappers/movie_mapper.dart';
import 'package:ghibli_fan_app/infrastructure/models/movie_model.dart';

class MoviesDatasourceImpl extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: "https://ghibliapi.vercel.app"),
  );

  @override
  Future<List<MovieEntity>> getMovies() async {
    final response = await dio.get('/films');

    List<MovieModel> moviesFromApi = (response.data as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();

    List<MovieEntity> movies =
        moviesFromApi.map((e) => MovieMapper.movieModelToEntity(e)).toList();

    return movies;
  }
}
