import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_bloc.dart';
import 'package:flutter_ramen_diary/bloc/login/login_event.dart';
import 'package:flutter_ramen_diary/bloc/login/login_state.dart';
import 'package:flutter_ramen_diary/constants/color_data.dart';
import 'package:flutter_ramen_diary/gen/assets.gen.dart';
import 'package:flutter_ramen_diary/helper/transition_helper.dart';
import 'package:flutter_ramen_diary/screen/login/login_button.dart';
import 'package:flutter_ramen_diary/screen/login/term_and_privacy_view.dart';
import 'package:flutter_ramen_diary/screen/mail_login/mail_login_screen_view.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key}) : super(key: key);

  final _bloc = LoginBloc();

  Widget _alreadyHaveAccount(BuildContext context) {
    final leftText = _bloc.state.registerMode ? 'すでにアカウントをお持ちの方' : '新規登録は';
    final rightText = _bloc.state.registerMode ? 'ログインする' : 'こちら';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: const TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: GestureDetector(
            onTap: () {
              _bloc.add(OnTapChangeRegisterMode());
            },
            child: Text(rightText,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: ColorData.gold,
                )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final apple = state.registerMode ? 'Appleで新規登録' : 'Appleでログイン';
        final google = state.registerMode ? 'Googleで新規登録' : 'Googleでログイン';
        final mail = state.registerMode ? 'メールで新規登録' : 'メールでログイン';
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                const Spacer(
                  flex: 3,
                ),
                const Text(
                  'ラーメン日記',
                  style: TextStyle(fontSize: 30),
                ),
                const Spacer(
                  flex: 2,
                ),
                if (state.registerMode) const TermAndPrivacyView(),
                const Padding(padding: EdgeInsets.only(top: 16)),
                if (Platform.isIOS)
                  LoginButton(
                    buttonText: apple,
                    iconPath: Assets.images.login.apple.path,
                    textColor: Colors.black,
                    bgColor: Colors.white,
                    onTap: () {
                      // _bloc.add(LoginAuthWithApple());
                    },
                  ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                LoginButton(
                  buttonText: google,
                  iconPath: Assets.images.login.google.path,
                  textColor: Colors.black,
                  bgColor: Colors.white,
                  onTap: () {
                    // _bloc.add(LoginAuthWithGoogle());
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                LoginButton(
                  buttonText: mail,
                  iconPath: Assets.images.login.mail.path,
                  textColor: Colors.white,
                  bgColor: Colors.black,
                  onTap: () {
                    TransitionHelper.push(
                      context,
                      MailLoginScreenView(),
                    );
                  },
                ),
                const Spacer(
                  flex: 2,
                ),
                _alreadyHaveAccount(context),
                const Padding(padding: EdgeInsets.only(top: 16)),
              ]),
            ),
          ),
        );
      },
      bloc: _bloc,
    );
  }
}
