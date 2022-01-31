import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_sqlite/providers/scan_list_provider.dart';
import 'package:qrcode_sqlite/utils/utils.dart';


class  ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      
      onPressed:  ()  async {

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF','Cancelar',false,ScanMode.QR);
        // const barcodeScanRes = 'https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/14575400#questions';
        // const barcodeScanRes = 'geo: 19.231982,-98.841172';
        if ( barcodeScanRes == '-1'){
          return;
          
        }
        // print(barcodeScanRes);
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        //  scanListProvider.nuevoScan('geo: 16.6.5.23');
         launchURL(context, nuevoScan);
      },

        
      
      
    );
  }
}