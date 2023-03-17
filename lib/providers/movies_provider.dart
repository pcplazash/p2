

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p2/models/credits_response.dart';
import 'package:p2/models/now_playing_response.dart';

import '../models/movie.dart';
import '../models/popular_response.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey   = '6bb3a65ebf8d6dbe0be98672ebdb6ecb';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List <Movie> onDisplayMovies = [];
  List <Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast ={};

  int _popularPage = 0;


  //constructor
  MoviesProvider(){
    print('movies provider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();

  }

  Future<String> _getJsonData(String endpoint, [int page=1])async{
    var url =
    Uri.https(_baseUrl, '3/movie/now_playing',
        {
          'api_key': _apiKey,
          'language': _language,
          'page': '$page',
        }
    );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies()async{

    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies()async{

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);

    notifyListeners();

  }

  Future <List<Cast>> getMovieCast(int movieId) async{

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    print('pidiendo info al server');

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;


  }

}