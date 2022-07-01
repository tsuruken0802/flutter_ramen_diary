import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_state.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key}) : super(key: key);

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
