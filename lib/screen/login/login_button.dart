import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;

  final String iconPath;

  final Color textColor;

  final Color bgColor;

  final VoidCallback onTap;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.iconPath,
    required this.textColor,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  Widget _text() {
    return Text(
      buttonText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    );
  }

  Image _image() {
    return Image.asset(
      iconPath,
      width: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  color: bgColor,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              _text(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: _image(),
          ),
        ],
      ),
    );
  }
}
