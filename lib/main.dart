import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/main/main_bloc.dart';
import 'package:flutter_ramen_diary/bloc/main/main_state.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_bloc.dart';
import 'package:flutter_ramen_diary/screen/create_account1/create_account1_screen_view.dart';
import 'package:flutter_ramen_diary/screen/home_tab/home_tab_screen_view.dart';
import 'package:flutter_ramen_diary/screen/login/login_screen_view.dart';
import 'package:flutter_ramen_diary/screen/splash/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state.nextScreen == MainNextScreen.login) {
              return LoginScreenView();
            } else if (state.nextScreen == MainNextScreen.account) {
              return CreateAccount1ScreenView();
            } else if (state.nextScreen == MainNextScreen.home) {
              return HomeTabScreenView();
            } else {
              return SplashScreenView();
            }
          },
          bloc: _bloc,
        ));
  }
}
