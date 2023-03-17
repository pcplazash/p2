
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';



class CardSwiper1 extends StatelessWidget {
  const CardSwiper1({Key? key,
    required this.movies
  }) : super(key: key);

  final List<Movie> movies;

  @override



  Widget build(BuildContext context) {

    final  size = MediaQuery.of(context).size;
    if(this.movies.length==0){
      return Container(
        width: double.infinity,
        height: size.height*0.57,

        child: Center(
          child: CircularProgressIndicator(

          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height*0.57,

      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.65,
        itemHeight: size.height*0.48,
        itemBuilder: (BuildContext context, int index){

          final movie = movies[index];
          print(movie.fullPosterImg);

          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/gif3.gif'),
                  image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },

      ),
    );
  }
}
