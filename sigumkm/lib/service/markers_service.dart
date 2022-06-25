import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../modal/umkm.dart';
import '../pages/description.dart';

class MarkerService {
  description descripsiUMKM = description();
  List<Marker> getMarkers(List<Umkm> umkm) {
    List<Marker> markers = [];

    umkm.forEach((umkm) {
      Marker marker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: MarkerId(umkm.id.toString()),
        draggable: false,
        infoWindow: InfoWindow(title: umkm.name),
        position: LatLng(umkm.latitude, umkm.longitude),
        // onTap: () => Get.to(descripsiUMKM.descriptionUmkm(
        //     umkm.name,
        //     umkm.address,
        //     umkm.districts,
        //     umkm.subdistricts,
        //     umkm.type_business,
        //     umkm.type)),
      );

      markers.add(marker);
    });

    return markers;
  }
}
