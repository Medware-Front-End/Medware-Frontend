import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';

class SettingRow extends StatefulWidget {
  final String text;
  final bool value;
  final Function(bool) onSwitched;
  const SettingRow({
    Key? key,
    required this.text,
    required this.value,
    required this.onSwitched,
  }) : super(key: key);

  @override
  _SettingRowState createState() => _SettingRowState();
}

class _SettingRowState extends State<SettingRow> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: size.width * 0.042),
        ),
        Switch(
          activeColor: primaryColor,
          value: widget.value,
          onChanged: widget.onSwitched,
        )
      ],
    );
  }
}
