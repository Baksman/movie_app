part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final int defaultIndex;
  final List<MovieEntity> movies;
  const MovieCarouselLoaded({this.defaultIndex = 0, this.movies})
      : assert(defaultIndex > 0, "Default index cant be zero");

  @override
  List<Object> get props => [defaultIndex, movies];
}
