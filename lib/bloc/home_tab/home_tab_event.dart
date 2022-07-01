import 'package:equatable/equatable.dart';

abstract class HomeTabEvent extends Equatable {
  const HomeTabEvent();

  @override
  List<Object?> get props => [];
}

class OnFirstRequest extends HomeTabEvent {}

class OnChangeCurrentIndex extends HomeTabEvent {
  final int currentIndex;

  const OnChangeCurrentIndex({
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [currentIndex];
}
