import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_bloc.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_event.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_state.dart';

class MailLoginScreenView extends StatelessWidget {
  MailLoginScreenView({Key? key}) : super(key: key);

  final _bloc = MailLoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MailLoginBloc, MailLoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.appBarTitle),
          ),
          body: Column(children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'メールアドレス',
              ),
              onChanged: (value) {
                _bloc.add(OnChangeMail(mail: value));
              },
            ),
            TextFormField(
              obscureText: !state.isVisiblePassword,
              decoration: InputDecoration(
                hintText: 'パスワード',
                suffixIcon: IconButton(
                  icon: Icon(
                    state.isVisiblePassword
                        ? Icons.visibility_off
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    _bloc.add(OnChangePasswordVisible());
                  },
                ),
              ),
              onChanged: (value) {
                _bloc.add(OnChangePassword(password: value));
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'パスワード確認',
              ),
              onChanged: (value) {
                _bloc.add(OnChangePasswordConfirm(password: value));
              },
            ),
          ]),
        );
      },
      bloc: _bloc,
    );
  }
}
