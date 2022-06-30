import 'package:flutter/material.dart';
import 'package:flutter_ramen_diary/constants/map_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

abstract class MapService {
  const MapService();

  getLocation();
}

class MapServiceImpl extends MapService {
  MapServiceImpl();

  final GooglePlace _googlePlace = GooglePlace(MapCostants.apiKey);

  static const String _launguageCode = 'ja';

  getLocation() async {
    final position = await Geolocator.getCurrentPosition();
    const radiusMeter = 1500;
    final List<SearchResult>? results = (await _googlePlace.search
            .getNearBySearch(
                Location(lat: position.latitude, lng: position.longitude),
                radiusMeter,
                language: _launguageCode,
                type: "restaurant",
                keyword: "ラーメン"))
        ?.results;
    print(results?.length);
  }
}
