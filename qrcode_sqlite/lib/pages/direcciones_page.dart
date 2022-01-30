import 'package:flutter/material.dart';
import 'package:qrcode_sqlite/widgets/scan_tiles.dart'; 

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  const ScanTiles(tipo: 'http');
  }
}