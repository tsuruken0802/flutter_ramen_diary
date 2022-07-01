import 'package:equatable/equatable.dart';

abstract class MailLoginEvent extends Equatable {
  const MailLoginEvent();

  @override
  List<Object?> get props => [];
}

class OnChangeMail extends MailLoginEvent {
  final String mail;

  const OnChangeMail({
    required this.mail,
  });

  @override
  List<Object?> get props => [mail];
}

class OnChangePassword extends MailLoginEvent {
  final String password;

  const OnChangePassword({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class OnChangePasswordVisible extends MailLoginEvent {}

class OnChangePasswordConfirm extends MailLoginEvent {
  final String password;

  const OnChangePasswordConfirm({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}
