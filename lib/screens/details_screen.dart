import 'package:flutter/material.dart';
import 'package:p2/widgets/widgets_barrel.dart';

import '../models/movie.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(

      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(delegate: SliverChildListDelegate(
            [
              _PosterAndTitle(movie: movie,),

              _Overview(movie: movie),

              CastingCards(movieId: 58,),

            ]
          )
            
          ),
        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {



    return SliverAppBar(
      backgroundColor: Colors.purple,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 12, right: 12),

          child: Text(
            movie.title,
          textAlign: TextAlign.center,
          style: TextStyle( fontSize: 16,
          ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/gif1.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/gif8.gif'),
              image: NetworkImage(movie.fullBackdropPath),
              height: 150,
              width: 100,
              fit: BoxFit.cover,

            ),
          ),
          SizedBox(width: 10,),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width-200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                  style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(movie.originalTitle,
                  style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Row(
                  children: [
                    Icon(Icons.star_border_outlined, size: 15, color: Colors.yellowAccent,),
                    SizedBox(width: 5,),
                    Text(
                     '${movie.voteAverage}',
                      style: textTheme.caption, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),


      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: textTheme.subtitle1,),
    );
  }
}
