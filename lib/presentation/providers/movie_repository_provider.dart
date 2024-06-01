import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghibli_fan_app/infrastructure/datasources/movies_datasource_impl.dart';
import 'package:ghibli_fan_app/infrastructure/repositories/movies_repository_impl.dart';

final movieRepositoryProvider = Provider(
    (ref) => MoviesRepositoryImpl(moviesDatasource: MoviesDatasourceImpl()));
