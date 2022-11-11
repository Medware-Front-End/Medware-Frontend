import 'package:flutter/material.dart';

class SettingTopic extends StatelessWidget {
  final String text;
  const SettingTopic({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
        Divider(
          thickness: 1,
          height: size.width * 0.02,
        ),
      ],
    );
  }
}
