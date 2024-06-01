import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghibli_fan_app/presentation/providers/random_movie_provider.dart';

class HomeScreen extends ConsumerWidget {
  static String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieRandom = ref.watch(randomMovieProvider);
    final randomMovieNotifier = ref.watch(randomMovieProvider.notifier);
    return Scaffold(
        backgroundColor: Colors.black,
        body: movieRandom != null
            ? Stack(
                children: [
                  FadeIn(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movieRandom.image),
                          fit: BoxFit.fitHeight,
                          colorFilter: ColorFilter.mode(
                            Colors.black
                                .withOpacity(0.9), // Adjust the opacity here
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        duration: const Duration(seconds: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            movieRandom.image,
                            height: 300.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${movieRandom.title} (${movieRandom.releaseDate})',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors
                                    .black54, // Optional: Add background color to text
                              ),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  movieRandom.originalTitle,
                                  style: const TextStyle(
                                    color: Colors.white,

                                    backgroundColor: Colors
                                        .black54, // Optional: Add background color to text
                                  ),
                                ),
                                Text(
                                  '(${movieRandom.originalTitleRomanised})',
                                  style: const TextStyle(
                                    color: Colors.white,

                                    backgroundColor: Colors
                                        .black54, // Optional: Add background color to text
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              movieRandom.description,
                              maxLines: 10,
                              style: const TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors
                                    .black54, // Optional: Add background color to text
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(23, 106, 144, 1),
                        ),
                        onPressed: () {
                          randomMovieNotifier.getRandomMovie();
                        },
                        child: const Text(
                          "Discover more Ghibli movies!",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
