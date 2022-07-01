import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String title;

  const LoginState({
    this.title = '',
  });

  LoginState copyWith({
    String? title,
  }) {
    return LoginState(
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
