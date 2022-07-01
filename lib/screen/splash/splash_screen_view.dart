import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_bloc.dart';
import 'package:flutter_ramen_diary/bloc/splash/splash_state.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  final _bloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            color: Colors.pink,
          ),
        );
      },
      bloc: _bloc,
    );
  }
}
