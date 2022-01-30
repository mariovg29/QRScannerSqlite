import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_sqlite/pages/home_page.dart';
import 'package:qrcode_sqlite/pages/mapa_page.dart';
import 'package:qrcode_sqlite/providers/scan_list_provider.dart';
import 'package:qrcode_sqlite/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UIProvider()),
        ChangeNotifierProvider(create: (_)=> ScanListProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_)=> const HomePage(),
          'mapa': (_)=> const MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.purple,
          floatingActionButtonTheme:const FloatingActionButtonThemeData(
            backgroundColor:  Color(0xffff6161),
          ),
          // primaryColor: const Color(0xffff6161)
        ),
        
      ),
    );
  }
}