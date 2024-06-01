import 'package:ghibli_fan_app/domain/entities/movie_entity.dart';
import 'package:ghibli_fan_app/infrastructure/models/movie_model.dart';

class MovieMapper {
  static MovieEntity movieModelToEntity(MovieModel movieResponse) {
    return MovieEntity(
        id: movieResponse.id,
        title: movieResponse.title,
        originalTitle: movieResponse.originalTitle,
        originalTitleRomanised: movieResponse.originalTitleRomanised,
        image: movieResponse.image,
        movieBanner: movieResponse.movieBanner,
        description: movieResponse.description,
        director: movieResponse.director,
        producer: movieResponse.producer,
        releaseDate: movieResponse.releaseDate,
        runningTime: movieResponse.runningTime,
        rtScore: movieResponse.rtScore,
        people: movieResponse.people,
        species: movieResponse.species,
        locations: movieResponse.locations,
        vehicles: movieResponse.vehicles,
        url: movieResponse.url);
  }
}
