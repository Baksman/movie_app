import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtil/screen_utils.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/animted_movie_carousel.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MoviePageView({Key key, this.movies, this.defaultIndex = 0})
      : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .7,
      keepPage: false,
      initialPage: widget.defaultIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * .35,
      child: PageView.builder(
        onPageChanged: (int index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
        pageSnapping: true,
        controller: _pageController,
        itemCount: widget.movies?.length ?? 0,
        itemBuilder: (context, indx) {
          final MovieEntity movie = widget.movies[indx];
          return AnimatedMovieCardWidget(
            index: indx,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}
