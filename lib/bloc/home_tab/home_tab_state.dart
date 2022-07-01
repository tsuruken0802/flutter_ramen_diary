import 'package:equatable/equatable.dart';
import 'package:flutter_ramen_diary/enum/request_status.dart';

class HomeTabState extends Equatable {
  final RequestStatus? requestStatus;

  const HomeTabState({
    this.requestStatus,
  });

  HomeTabState copyWith({
    RequestStatus? requestStatus,
  }) {
    return HomeTabState(
      requestStatus: requestStatus ?? RequestStatus.idle,
    );
  }

  @override
  List<Object?> get props => [
        requestStatus,
      ];
}
