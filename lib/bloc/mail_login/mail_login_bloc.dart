import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_event.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_service.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_state.dart';
import 'package:flutter_ramen_diary/helper/auth_helper.dart';
import 'package:flutter_ramen_diary/helper/mail_validator.dart';

class MailLoginBloc extends Bloc<MailLoginEvent, MailLoginState> {
  late final MailLoginService _service;

  MailLoginBloc() : super(const MailLoginState()) {
    _service = MailLoginServiceImpl();
    on<OnChangeMail>(_onChangeMail);
    on<OnChangePassword>(_onChangePassword);
    on<OnChangePasswordVisible>(_onChangePasswordVisible);
    on<OnChangePasswordConfirm>(_onChangePasswordConfirm);
    on<OnTapRegister>(_onTapRegister);
  }

  _onChangeMail(OnChangeMail event, Emitter<MailLoginState> emit) async {
    emit(state.copyWith(
        isValidMail: MailValidator.isValidMailAddress(event.mail)));
  }

  _onChangePassword(
      OnChangePassword event, Emitter<MailLoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  _onChangePasswordVisible(
      OnChangePasswordVisible event, Emitter<MailLoginState> emit) async {
    emit(state.copyWith(isVisiblePassword: !state.isVisiblePassword));
  }

  _onChangePasswordConfirm(
      OnChangePasswordConfirm event, Emitter<MailLoginState> emit) async {
    emit(state.copyWith(passwordConfirm: event.password));
  }

  _onTapRegister(OnTapRegister event, Emitter<MailLoginState> emit) async {}
}
