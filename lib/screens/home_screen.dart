import 'package:flutter/material.dart';
import 'package:p2/widgets/widgets_barrel.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('peliculas en cine'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper1(movies: moviesProvider.onDisplayMovies),

            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),

            ),





          ],
        ),
      )
    );
  }
}
