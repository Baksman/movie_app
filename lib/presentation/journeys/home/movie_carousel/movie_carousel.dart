import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_back_drop_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movie_app/presentation/widgets/movie_appbar.dart';
import 'package:movie_app/presentation/widgets/seperator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({Key key, this.movies, this.defaultIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies, defaultIndex: defaultIndex),
            MovieDataWidget(),
            Separator()
          ],
        ),
      ],
    );
  }
}
