import 'package:flutter/material.dart';

class TransitionHelper {
  /// フェードインアウトで遷移する
  static fade(BuildContext context, Widget nextScreen) {
    Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
      return nextScreen;
    }, transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      return FadeTransition(opacity: animation, child: child);
    }));
  }

  /// プッシュで遷移する
  static push(BuildContext context, Widget nextScreen, {bool animated = true}) {
    Route route = animated
        ? MaterialPageRoute(builder: (context) => nextScreen)
        : PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => nextScreen,
            transitionDuration: const Duration(seconds: 0),
          );
    Navigator.of(context).push(route);
  }

  /// プッシュで遷移する(前の画面に戻れなくする)
  static pushReplacement(BuildContext context, Widget nextScreen,
      {bool animated = true}) {
    Route route = animated
        ? MaterialPageRoute(builder: (context) => nextScreen)
        : PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => nextScreen,
            transitionDuration: const Duration(seconds: 0),
          );
    Navigator.of(context).pushAndRemoveUntil(route, (_) => false);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// 画面を全て閉じてフェードインアウトで遷移する
  static fadeWithRemoveUtil(BuildContext context, Widget nextScreen) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
          return nextScreen;
        }, transitionsBuilder:
            (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(opacity: animation, child: child);
        }),
        (_) => false);
  }

  static modal(BuildContext context, Widget nextScreen) async {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return nextScreen;
        },
        fullscreenDialog: true));
  }

  static dismiss<T extends Object?>(BuildContext context, {T? object}) {
    Navigator.of(context, rootNavigator: true).pop(object);
  }
}
