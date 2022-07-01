import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class OnFirstRequest extends LoginEvent {}

class OnTapChangeRegisterMode extends LoginEvent {}
