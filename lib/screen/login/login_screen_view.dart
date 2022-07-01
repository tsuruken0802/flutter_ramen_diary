import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_state.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key}) : super(key: key);

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            const Text('ラーメン日記'),
            SignInWithAppleButton(onPressed: () {}),
            GoogleSignInButton(clientId: ''),
          ]),
        );
      },
      bloc: _bloc,
    );
  }
}
