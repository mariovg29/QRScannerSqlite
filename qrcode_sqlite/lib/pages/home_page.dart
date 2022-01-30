import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_sqlite/pages/direcciones_page.dart';
import 'package:qrcode_sqlite/pages/historial_mapas_page.dart';
import 'package:qrcode_sqlite/providers/scan_list_provider.dart';
import 'package:qrcode_sqlite/providers/ui_provider.dart';
import 'package:qrcode_sqlite/widgets/custom_navigatorbar.dart';
import 'package:qrcode_sqlite/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(onPressed: (){
            final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
            scanListProvider.borrarScans();
          }, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtener el selectedMenuOpt
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: temporal leer la base de datos
    // final tempScan = new ScanModel(tipo: 'hola', valor: 'Mario');
    // DBProvider.db.getScanById(3).then((scan) => print(scan!.valor));
    // DBProvider.db.getScansAll().then((scan) => print(scan));
    //  DBProvider.db.getScansByTipo('las').then((scan) => print(scan));
    //  DBProvider.db.deleteAllScans().then(print);
   
     

     //Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch ( currentIndex) {
      case 0:
      scanListProvider.cargarScansTipo('geo');
        return const HistorialMapasPage();

      case 1:
      scanListProvider.cargarScansTipo('http');
        return const DireccionesPage();


      default: return const HistorialMapasPage();

    }
  }
}