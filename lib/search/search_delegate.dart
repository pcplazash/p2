
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      Text('buildActions'),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('buildLEading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildsugestions');
  }

}