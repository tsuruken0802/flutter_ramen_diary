import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_bloc.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_event.dart';
import 'package:flutter_ramen_diary/bloc/mail_login/mail_login_state.dart';
import 'package:flutter_ramen_diary/screen/common/primary_button.dart';

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 16.0)),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'メールアドレス',
                    ),
                    onChanged: (value) {
                      _bloc.add(OnChangeMail(mail: value));
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16.0)),
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
                  const Padding(padding: EdgeInsets.only(top: 16.0)),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'パスワード確認',
                    ),
                    onChanged: (value) {
                      _bloc.add(OnChangePasswordConfirm(password: value));
                    },
                  ),
                  const Spacer(),
                  PrimaryButton(
                      buttonTitle: '新規登録',
                      enable: state.isValidMail,
                      onTap: () {}),
                  const Padding(padding: EdgeInsets.only(top: 16.0)),
                ],
              ),
            ),
          ),
        );
      },
      bloc: _bloc,
    );
  }
}
