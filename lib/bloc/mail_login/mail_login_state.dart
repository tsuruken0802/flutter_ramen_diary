import 'package:equatable/equatable.dart';

class MailLoginState extends Equatable {
  final bool registerMode;

  final String mail;

  final String password;

  final String passwordConfirm;

  final bool isValidMail;

  final bool isVisiblePassword;

  const MailLoginState({
    this.registerMode = true,
    this.mail = '',
    this.password = '',
    this.passwordConfirm = '',
    this.isValidMail = false,
    this.isVisiblePassword = false,
  });

  MailLoginState copyWith({
    bool? registerMode,
    String? mail,
    String? password,
    String? passwordConfirm,
    bool? isValidMail,
    bool? isVisiblePassword,
  }) {
    return MailLoginState(
      registerMode: registerMode ?? this.registerMode,
      mail: mail ?? this.mail,
      password: password ?? this.password,
      passwordConfirm: password ?? this.password,
      isValidMail: isValidMail ?? this.isValidMail,
      isVisiblePassword: isVisiblePassword ?? this.isVisiblePassword,
    );
  }

  String get appBarTitle {
    if (registerMode) {
      return '新規登録';
    } else {
      return 'ログイン';
    }
  }

  @override
  List<Object?> get props => [
        registerMode,
        mail,
        password,
        passwordConfirm,
        isValidMail,
        isVisiblePassword,
      ];
}
