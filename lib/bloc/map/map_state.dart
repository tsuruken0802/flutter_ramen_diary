import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class MapState extends Equatable {
  final Position? firstPosition;

  const MapState({
    this.firstPosition,
  });

  MapState copyWith({
    Position? firstPosition,
  }) {
    return MapState(firstPosition: firstPosition ?? this.firstPosition);
  }

  @override
  List<Object?> get props => [
        firstPosition,
      ];
}
