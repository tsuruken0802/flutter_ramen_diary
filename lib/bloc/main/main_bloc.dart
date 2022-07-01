import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/main/main_event.dart';
import 'package:flutter_ramen_diary/bloc/main/main_service.dart';
import 'package:flutter_ramen_diary/bloc/main/main_state.dart';
import 'package:flutter_ramen_diary/helper/auth_helper.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  late final MainService _service;

  MainBloc() : super(const MainState()) {
    _service = MainServiceImpl();
    on<OnFirstRequest>(_onFirstRequest);
    add(OnFirstRequest());
  }

  _onFirstRequest(OnFirstRequest event, Emitter<MainState> emit) async {
    // ログイン判定
    if (AuthHelper.isLogin) {
      // アカウントチェック
      if (await _service.existMyUser()) {
        emit(state.copyWith(nextScreen: MainNextScreen.home));
      } else {
        emit(state.copyWith(nextScreen: MainNextScreen.account));
      }
    } else {
      emit(state.copyWith(nextScreen: MainNextScreen.login));
    }
  }
}
