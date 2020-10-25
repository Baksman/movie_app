import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_listview.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tab_constant.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWdiget extends StatefulWidget {
  @override
  _MovieTabbedWdigetState createState() => _MovieTabbedWdigetState();
}

class _MovieTabbedWdigetState extends State<MovieTabbedWdiget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movietabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    movietabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
              TabTitleWidget(
                title: MovieTabbedConstants.movieTabs[i].title,
                onTap: () => _onTabTapped(i),
                isSelected: MovieTabbedConstants.movieTabs[i].index ==
                    state.currentTabIndex,
              ),
            if (state is MovieTabChanged)
              Expanded(child: MovieListViewBuilder(movies: state.movies))
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movietabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
