import 'package:equatable/equatable.dart';

class HomeTabState extends Equatable {
  final String title;

  const HomeTabState({
    this.title = '',
  });

  HomeTabState copyWith({
    String? title,
  }) {
    return HomeTabState(
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
