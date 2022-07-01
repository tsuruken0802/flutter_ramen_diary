import 'package:equatable/equatable.dart';

enum MainStatus { idle, checkingAccount, syncingData }

class MainState extends Equatable {
  final MainStatus mainStatus;

  const MainState({
    this.mainStatus = MainStatus.idle,
  });

  MainState copyWith({
    MainStatus? mainStatus,
  }) {
    return MainState(
      mainStatus: mainStatus ?? this.mainStatus,
    );
  }

  @override
  List<Object?> get props => [
        mainStatus,
      ];
}
