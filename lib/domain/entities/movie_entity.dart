import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final int id;
  final num voteAverage;

  const MovieEntity(
      {@required this.posterPath,
      @required this.backdropPath,
      @required this.title,
      @required this.overview,
      @required this.releaseDate,
      @required this.id,
      @required this.voteAverage})
      : assert(id != null, "movie id cannot be null");

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
