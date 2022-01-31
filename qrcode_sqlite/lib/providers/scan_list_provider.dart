

import 'package:flutter/material.dart';
import 'package:qrcode_sqlite/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel>  nuevoScan(String valor) async  {

    final nuevoScan = ScanModel(tipo : tipoSeleccionado, valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    //Asignar el id de la base de datos al modelo
    nuevoScan.id= id;

    if ( tipoSeleccionado == nuevoScan.tipo){
    scans.add(nuevoScan);
    notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getScansAll();
    this.scans= [...?scans];
    notifyListeners();

  }
  cargarScansTipo(String tipo) async{
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans= [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
    
  }
  borrarScans()async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
    
  }

  borrarScansByID( int id)async {
    await DBProvider.db.deleteScan(id);
    cargarScansTipo( tipoSeleccionado);
    
  }

}