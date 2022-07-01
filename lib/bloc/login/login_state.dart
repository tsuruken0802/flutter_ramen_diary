import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool registerMode;

  const LoginState({
    this.registerMode = true,
  });

  LoginState copyWith({
    bool? registerMode,
  }) {
    return LoginState(
      registerMode: registerMode ?? this.registerMode,
    );
  }

  @override
  List<Object?> get props => [
        registerMode,
      ];
}
