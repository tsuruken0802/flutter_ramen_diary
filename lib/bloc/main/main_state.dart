import 'package:equatable/equatable.dart';

enum MainStatus { idle, checkingAccount, syncingData }

enum MainNextScreen {
  none,
  login,
  account,
  home,
}

class MainState extends Equatable {
  final MainStatus mainStatus;

  final MainNextScreen nextScreen;

  const MainState({
    this.mainStatus = MainStatus.idle,
    this.nextScreen = MainNextScreen.none,
  });

  MainState copyWith({
    MainStatus? mainStatus,
    MainNextScreen? nextScreen,
  }) {
    return MainState(
      mainStatus: mainStatus ?? this.mainStatus,
      nextScreen: nextScreen ?? this.nextScreen,
    );
  }

  @override
  List<Object?> get props => [
        mainStatus,
        nextScreen,
      ];
}
