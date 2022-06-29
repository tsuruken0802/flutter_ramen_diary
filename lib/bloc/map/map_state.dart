import 'package:equatable/equatable.dart';

class MapState extends Equatable {
  final String title;

  const MapState({
    required this.title,
  });

  MapState copyWith({
    String? title,
  }) {
    return MapState(title: title ?? this.title);
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
