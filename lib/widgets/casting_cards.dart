
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/credits_response.dart';
import '../providers/movies_provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot <List<Cast>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 100),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard(this.actor );
  final Cast actor;

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/gif7.gif'),
              image: NetworkImage(actor.fullProfilePath),
              width: 140,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height:5),
          Text(actor.name,
          maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }
}
