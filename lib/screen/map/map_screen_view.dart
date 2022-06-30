import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/map/map_bloc.dart';
import 'package:flutter_ramen_diary/bloc/map/map_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenView extends StatelessWidget {
  MapScreenView({Key? key}) : super(key: key);

  final _bloc = MapBloc();

  final Completer<GoogleMapController> _controller = Completer();

  _unableMapView() {
    return const Text('マップを表示できません');
  }

  _map(Position position) {
    final cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14);
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        final firstPosition = state.firstPosition;
        return Scaffold(
          appBar: AppBar(),
          body: firstPosition != null ? _map(firstPosition) : _unableMapView(),
        );
      },
      bloc: _bloc,
    );
  }
}
