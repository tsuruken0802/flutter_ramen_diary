import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ramen_diary/entity/firestore/user/fs_user.dart';
import 'package:flutter_ramen_diary/entity/firestore/user/fs_user_dto.dart';
import 'package:flutter_ramen_diary/service/fs_ref_service.dart';
import 'package:flutter_ramen_diary/extension/identifiable_query_document_snapshot.dart';

abstract class UserRepository {
  const UserRepository();

  /// ユーザー情報を取得する
  Future<FSUser?> fetch(String uid);

  /// ユーザーが存在するかチェックする
  Future<bool> exists(String uid);

  /// アカウントを登録する
  Future<void> register({
    required String uid,
    required FSUserDto dto,
  });

  /// アカウントを更新する
  Future<void> update({
    required String uid,
    required FSUserDto dto,
  });
}

class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl();

  @override
  Future<FSUser?> fetch(String uid) async {
    final document = await FSRefService.user(uid: uid).get();
    final data = document.optionalDataWithId();
    if (data == null) {
      return null;
    }
    return FSUser.fromJson(data);
  }

  /// ユーザーが存在するかチェックする
  @override
  Future<bool> exists(String uid) async {
    final DocumentSnapshot snapshot = await FSRefService.user(uid: uid).get();
    return snapshot.exists;
  }

  /// アカウントを登録する
  @override
  Future<void> register({
    required String uid,
    required FSUserDto dto,
  }) async {
    final createUerRef = FSRefService.user(uid: uid);
    return createUerRef.set(dto.toJson());
  }

  /// アカウントを更新する
  @override
  Future<void> update({
    required String uid,
    required FSUserDto dto,
  }) {
    final ref = FSRefService.user(uid: uid);
    return ref.set(dto.toJson(), SetOptions(merge: true));
  }
}
