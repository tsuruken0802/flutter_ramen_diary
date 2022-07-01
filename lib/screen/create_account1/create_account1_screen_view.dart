import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/create_account1/create_account1_bloc.dart';
import 'package:flutter_ramen_diary/bloc/create_account1/create_account1_state.dart';

class CreateAccount1ScreenView extends StatelessWidget {
  CreateAccount1ScreenView({Key? key}) : super(key: key);

  final _bloc = CreateAccount1Bloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccount1Bloc, CreateAccount1State>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(),
        );
      },
      bloc: _bloc,
    );
  }
}
