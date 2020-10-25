import "package:flutter/material.dart";
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w,
          );
        },
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
            title: movie.title,
          );
        },
      ),
    );
  }
}
