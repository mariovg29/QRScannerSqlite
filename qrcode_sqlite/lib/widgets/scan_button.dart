import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_sqlite/providers/scan_list_provider.dart';


class  ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      
      onPressed:  ()  async {

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF','Cancelar',false,ScanMode.QR);
        const barcodeScanRes = 'https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/14575400#questions';

        // print(barcodeScanRes);
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
         scanListProvider.nuevoScan('geo: 16.6.5.23');
      },

        
      
      
    );
  }
}