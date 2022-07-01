import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/create_account1/create_account1_event.dart';
import 'package:flutter_ramen_diary/bloc/create_account1/create_account1_service.dart';
import 'package:flutter_ramen_diary/bloc/create_account1/create_account1_state.dart';

class CreateAccount1Bloc extends Bloc<CreateAccount1Event, CreateAccount1State> {
  late final CreateAccount1Service _service;

  CreateAccount1Bloc() : super(const CreateAccount1State()) {
    _service = CreateAccount1ServiceImpl();
    on<OnFirstRequest>(_onFirstRequest);
    add(OnFirstRequest());
  }

  _onFirstRequest(OnFirstRequest event, Emitter<CreateAccount1State> emit) async {}
}
