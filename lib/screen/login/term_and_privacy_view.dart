import 'package:flutter/material.dart';
import 'package:flutter_ramen_diary/constants/color_data.dart';
import 'package:flutter_ramen_diary/constants/url_constants.dart';
import 'package:flutter_ramen_diary/helper/url_helper.dart';

/// 利用規約とプライバシーポリシーのテキストのWidget
class TermAndPrivacyView extends StatelessWidget {
  const TermAndPrivacyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text _termText({required String text}) {
      return Text(
        text,
        style: const TextStyle(fontSize: 12),
      );
    }

    Widget _termButtonText({
      required String text,
      required String url,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: ColorData.gold,
              decoration: TextDecoration.underline),
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 5,
      children: [
        _termText(text: '新規登録することで、'),
        _termButtonText(
          text: '利用規約',
          url: UrlConstants.term,
          onTap: () {
            UrlHelper.launch(urlString: UrlConstants.term);
          },
        ),
        _termText(text: 'と'),
        _termButtonText(
          text: 'プライバシーポリシー',
          url: UrlConstants.privacyPolicy,
          onTap: () {
            UrlHelper.launch(urlString: UrlConstants.privacyPolicy);
          },
        ),
        _termText(text: 'に同意するものとします。'),
      ],
    );
  }
}
