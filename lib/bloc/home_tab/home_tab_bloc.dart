import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_event.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_service.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_state.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  late final HomeTabService _service;

  HomeTabBloc() : super(const HomeTabState()) {
    _service = HomeTabServiceImpl();
    on<OnFirstRequest>(_onFirstRequest);
    add(OnFirstRequest());
  }

  _onFirstRequest(OnFirstRequest event, Emitter<HomeTabState> emit) async {}
}
