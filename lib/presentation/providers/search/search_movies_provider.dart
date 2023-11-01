import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifierState, List<Movie>>((ref) {
  final moviesReposity = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifierState(
    searchMovies: moviesReposity.searchMovies,
    ref: ref,
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifierState extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;
  SearchMoviesNotifierState({
    required this.ref,
    required this.searchMovies,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    print(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
