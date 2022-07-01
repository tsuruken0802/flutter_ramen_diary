import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ramen_diary/constants/fs_collections.dart';

class FSRefService {
  static FirebaseFirestore get _fs => FirebaseFirestore.instance;

  // AppConfigのドキュメント
  static DocumentReference<Map<String, dynamic>> appConfig() {
    return _fs.collection(FSCollections.users).doc('appConfig');
  }

  // ユーザーコレクション
  static CollectionReference<Map<String, dynamic>> users() {
    return _fs.collection(FSCollections.users);
  }

  // ユーザー
  static DocumentReference<Map<String, dynamic>> user({required String uid}) {
    return _fs.collection(FSCollections.users).doc(uid);
  }
}
