import 'package:flutter/material.dart';
import 'package:flutter_ramen_diary/constants/color_data.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final bool enable;
  final Color enableBgColor;
  final Color enableTextColor;
  final VoidCallback onTap;

  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.enable,
    required this.onTap,
    this.enableBgColor = ColorData.themeColor,
    this.enableTextColor = Colors.white,
  }) : super(key: key);

  Color _textColor() {
    return enable ? enableTextColor : Colors.grey;
  }

  Color _bgColor() {
    return enable ? enableBgColor : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _bgColor(),
        onPrimary: Colors.white,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: enable ? onTap : null,
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: _textColor(),
        ),
      ),
    );
  }
}
