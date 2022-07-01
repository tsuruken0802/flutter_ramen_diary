import 'package:equatable/equatable.dart';

class HomeTabState extends Equatable {
  final int currentIndex;

  const HomeTabState({
    this.currentIndex = 0,
  });

  HomeTabState copyWith({
    int? currentIndex,
  }) {
    return HomeTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
