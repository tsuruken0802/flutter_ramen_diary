import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_event.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_service.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  late final SplashService _service;

  SplashBloc() : super(const SplashState()) {
    _service = SplashServiceImpl();
    on<OnFirstRequest>(_onFirstRequest);
    add(OnFirstRequest());
  }

  _onFirstRequest(OnFirstRequest event, Emitter<SplashState> emit) async {}
}
