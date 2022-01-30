import 'package:flutter/material.dart';
import 'package:qrcode_sqlite/Models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL( BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  //abrir el sitio web
  if( scan.tipo == 'http'){
  if (!await launch(url)) throw 'Could not launch $url';
  }else {
    print('geo');
  }
}