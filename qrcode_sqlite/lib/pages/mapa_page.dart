import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrcode_sqlite/Models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller = Completer();

  MapType maptype = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    CameraPosition _puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 17.0,
    tilt: 50,
  );

  //Marcadores
  Set<Marker> markers = Set<Marker>();
  markers.add( Marker(
    markerId: const MarkerId('geo-location'),
    position: scan.getLatLng()
    ));

    
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa'),
          actions: [
            IconButton(
              onPressed: ()async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: scan.getLatLng(),
                    zoom: 17,
                    tilt: 50

                    )
                  ));
                }, 
              icon: const Icon(Icons.location_on))
          ],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        mapType: maptype,
        markers: markers,
        initialCameraPosition: _puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: (){
          if (maptype == MapType.normal){
            maptype = MapType.satellite;
          }else{
            maptype = MapType.normal;
          }
          setState(() {
            
          });
        },
      ),
      );
            
    
  }
}