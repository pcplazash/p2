import 'package:flutter/material.dart';
import 'package:p2/providers/movies_provider.dart';
import 'package:p2/screens/screens_barrel.dart';
import 'package:provider/provider.dart';


void main() => runApp(AppState());

//mantenemos el estado de la app (según el movies provider)
class AppState extends StatelessWidget {


  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> MoviesProvider(),
            lazy: false,
          ),
        ],

      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
      'home': (_) => HomeScreen(),
      'details': (_)=>DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.greenAccent,
        )
      ),
    );

  }
}
