import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/map/map_event.dart';
import 'package:flutter_ramen_diary/bloc/map/map_state.dart';
import 'package:flutter_ramen_diary/service/map_service.dart';
import 'package:geolocator/geolocator.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  late final MapService _service;

  MapBloc() : super(const MapState()) {
    _service = MapServiceImpl();
    on<RequestLocationPermission>(_onRequestLocationPermission);
    add(RequestLocationPermission());
  }

  _onRequestLocationPermission(
      RequestLocationPermission event, Emitter<MapState> emit) async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final position = await Geolocator.getCurrentPosition();
      emit(state.copyWith(firstPosition: position));
    }
  }

  // _onYearChanged(YearChanged event, Emitter<AddBirthdayState> emit) {
  //   emit(state.copyWith(dto: state.dto.copyWith(year: event.year)));
  // }

  // _onMonthChanged(MonthChanged event, Emitter<AddBirthdayState> emit) {
  //   emit(state.copyWith(dto: state.dto.copyWith(month: event.month)));
  // }

  // _onDayChanged(DayChanged event, Emitter<AddBirthdayState> emit) {
  //   emit(state.copyWith(dto: state.dto.copyWith(day: event.day)));
  // }
}
