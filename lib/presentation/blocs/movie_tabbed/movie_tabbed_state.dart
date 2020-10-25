part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  // by putting it here if the current tabis tapped state wil not be emited
  final int currentTabIndex;
  const MovieTabbedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final int currentTabIndex;
  const MovieTabLoadError({this.currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
