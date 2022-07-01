import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final String title;

  const SplashState({
    this.title = '',
  });

  SplashState copyWith({
    String? title,
  }) {
    return SplashState(
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
