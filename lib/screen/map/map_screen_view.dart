import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/map/map_bloc.dart';

class MapScreenView extends StatelessWidget {
  MapScreenView({Key? key}) : super(key: key);

  final _bloc = AddBirthdayBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
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
