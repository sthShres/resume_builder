import 'package:flutter/material.dart';


class CustomAppBarThisProject extends StatelessWidget {
  final TextStyle? textStyle;
  final String appbarTitle;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBarThisProject(
      {Key? key,
      this.textStyle,
      required this.appbarTitle,
      this.actions,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: actions,
      leading: leading,
      title: Text(
        appbarTitle,
        style: textStyle??
            TextStyle(
               fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
