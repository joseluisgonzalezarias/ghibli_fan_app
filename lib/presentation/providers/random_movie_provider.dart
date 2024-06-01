import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';
import 'package:ghibli_fan_app/presentation/providers/movies_provider.dart';

final randomMovieProvider =
    StateNotifierProvider<RandomMovieNotifier, MovieEntity?>(
  (ref) {
    return RandomMovieNotifier(ref)..getRandomMovie();
  },
);

class RandomMovieNotifier extends StateNotifier<MovieEntity?> {
  RandomMovieNotifier(this.ref) : super(null);
  Ref ref;

  Future<void> getRandomMovie() async {
    final movies = ref.watch(moviesProvider);

    if (movies.isNotEmpty) {
      Random random = Random();
      int randomIndex = random.nextInt(movies.length);
      MovieEntity randomMovie = movies[randomIndex];
      state = randomMovie;
    }
  }
}
