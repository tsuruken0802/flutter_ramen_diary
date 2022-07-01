import 'package:flutter/material.dart';
import 'package:flutter_ramen_diary/helper/auth_helper.dart';
import 'package:flutter_ramen_diary/repository/firestore/users_repository.dart';

abstract class MainService {
  final UserRepository repository;

  const MainService({
    this.repository = const UserRepositoryImpl(),
  });

  Future<bool> existMyUser();
}

class MainServiceImpl extends MainService {
  @override
  Future<bool> existMyUser() async {
    final uid = AuthHelper.uid;
    if (uid == null) {
      return false;
    }
    try {
      return repository.exists(uid);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
