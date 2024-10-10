import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salesforce/view/home/sales/controller/sales.controller.dart';

class Maps extends GetView<SalesController> {
  Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: controller.onMapCreated,
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: controller.officeLocation.value,
            zoom: 18.0
          ),
          markers: {
            Marker(
              markerId: const MarkerId('Toko 1'),
              position: controller.officeLocation.value,
              infoWindow: const InfoWindow(title: 'Toko 1 Location'),
              icon: BitmapDescriptor.defaultMarker,
            )
          },
        ),
      ),
    ));
  }
}
