import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocodingApi {
  buscarLocalizacaoPorEnd(String end) async {
    List<Location> localizacoes = await locationFromAddress(end);
    if (localizacoes.isNotEmpty) {
      double lat = localizacoes[0].latitude;
      double long = localizacoes[0].longitude;
      return LatLng(lat, long);
    }
    return const LatLng(0, 0);
  }
}
