import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_event.dart';
import 'package:flutter_ramen_diary/bloc/login/login_service.dart';
import 'package:flutter_ramen_diary/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final LoginService _service;

  LoginBloc() : super(const LoginState()) {
    _service = LoginServiceImpl();
    on<OnFirstRequest>(_onFirstRequest);
    on<OnTapChangeRegisterMode>(_onTapChangeRegisterMode);
    add(OnFirstRequest());
  }

  _onFirstRequest(OnFirstRequest event, Emitter<LoginState> emit) async {}

  _onTapChangeRegisterMode(
      OnTapChangeRegisterMode event, Emitter<LoginState> emit) async {
    emit(state.copyWith(registerMode: !state.registerMode));
  }
}
