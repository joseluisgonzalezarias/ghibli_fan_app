import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';
import 'package:ghibli_fan_app/presentation/providers/movie_repository_provider.dart';

final moviesProvider = StateNotifierProvider<MoviesNotifier, List<MovieEntity>>(
  (ref) {
    final fetchMovies = ref.watch(movieRepositoryProvider).getMovies;
    return MoviesNotifier(fetchMovies)..loadMovies();
  },
);

typedef MovieCallBack = Future<List<MovieEntity>> Function();

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  MovieCallBack fetchMovies;

  MoviesNotifier(this.fetchMovies) : super([]);

  Future<void> loadMovies() async {
    final List<MovieEntity> movies = await fetchMovies();

    state = [...movies];
  }
}
