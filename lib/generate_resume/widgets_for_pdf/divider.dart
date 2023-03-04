import 'package:flutter/material.dart';

class ResumeBuildDivider extends StatelessWidget {
  const ResumeBuildDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 3,
        left: 15,
        right: 15,
      ),
      child: Divider(
        color: Color(0xffd5dddf),
        thickness: 1,
      ),
    );
  }
}
