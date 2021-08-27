import 'package:flutter/material.dart';
import 'package:flutter_controle_scroll/pages/restaurante_detalhes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Scroll',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.white,
          elevation: 0,
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
        ),
        tabBarTheme: TabBarTheme.of(context).copyWith(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey[500],
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      home: RestauranteDetalhes(),
    );
  }
}
