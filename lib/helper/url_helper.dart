import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future launch({
    required String urlString,
    bool forceSafariVC = false,
  }) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      return;
    }
    await launchUrl(url);
  }

  static Future launchTel({
    required String tel,
  }) {
    return launch(urlString: 'tel:$tel');
  }
}
