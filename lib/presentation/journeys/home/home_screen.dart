import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieCarouselBackdrop;

  @override
  void initState() {
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBackdrop = movieCarouselBloc.movieBackdropBloc;
    movieCarouselBloc.add(CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc?.close();
    movieCarouselBackdrop?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // user stackfit.expand when you use fractionally sizedbox;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => movieCarouselBloc),
        BlocProvider(create: (_) => movieCarouselBackdrop)
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex)),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(
                      color: Colors.white,
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
