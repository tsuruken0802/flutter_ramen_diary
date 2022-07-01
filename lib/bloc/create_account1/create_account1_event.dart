import 'package:equatable/equatable.dart';

abstract class CreateAccount1Event extends Equatable {
  const CreateAccount1Event();

  @override
  List<Object?> get props => [];
}

class OnFirstRequest extends CreateAccount1Event {}
