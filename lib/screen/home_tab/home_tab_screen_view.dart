import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_bloc.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_event.dart';
import 'package:flutter_ramen_diary/bloc/home_tab/home_tab_state.dart';
import 'package:flutter_ramen_diary/screen/ate_posts/ate_posts_screen_view.dart';
import 'package:flutter_ramen_diary/screen/map/map_screen_view.dart';

// import 'package:moor_db_viewer/moor_db_viewer.dart';
// import 'package:winly_flutter/views/debug_data_uploader/master_data_uploader_view.dart';
// import 'package:winly_flutter/helper/database_manager.dart';

class HomeTabScreenView extends StatelessWidget {
  final HomeTabBloc _bloc = HomeTabBloc();

  final AtePostsScreenView atePosts = const AtePostsScreenView();

  final MapScreenView map = MapScreenView();

  HomeTabScreenView({Key? key}) : super(key: key);

  // final uploader = MasterDataUploaderView();

  // final dbviewer = MoorDbViewer(DatabaseManager.share.db);

  List<Widget> _widgets(BuildContext context) {
    return [
      atePosts,
      map,
      // uploader,
      // dbviewer,
    ];
  }

  _onTapTab(int index) {
    _bloc.add(OnChangeCurrentIndex(currentIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabBloc, HomeTabState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: _widgets(context),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_bulleted), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
            ],
            currentIndex: state.currentIndex,
            onTap: _onTapTab,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
      bloc: _bloc,
    );
  }
}
