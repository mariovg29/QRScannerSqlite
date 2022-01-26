import 'package:flutter/material.dart';
import 'package:qrcode_sqlite/pages/home_page.dart';
import 'package:qrcode_sqlite/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_)=> const HomePage(),
        'mapa': (_)=> const MapaPage()
      },
      theme: ThemeData(
        primaryColor: Colors.green,
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor:  Color(0xffff6161),
        ),
        // primaryColor: const Color(0xffff6161)
      ),
      
    );
  }
}