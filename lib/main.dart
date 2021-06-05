import 'package:flutter/material.dart';
import 'package:paginas/pages/buttons_page.dart';
import 'package:paginas/pages/pages_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pages',
      routes: {
        'pages':(_) => PagesPage(),
        'buttons':(_) => ButtonsPage(),
      },
    );
  }
}