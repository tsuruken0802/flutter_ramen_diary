import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  /// ログインしているかどうか
  static bool get isLogin {
    return FirebaseAuth.instance.currentUser != null;
  }

  /// ログアウトする
  static Future<void> logout() async {
    // Googleは別個でログアウトしないと次にログインするときにアカウント選択が表示されない
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }

    return FirebaseAuth.instance.signOut();
  }

  // ユーザーIDを取得する
  static String? get uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return user.uid;
  }

  // ユーザーのメールアドレスを取得する
  static String? get mailAddress {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return user.email;
  }
}
