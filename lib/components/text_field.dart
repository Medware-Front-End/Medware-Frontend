import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? validator;
  const CustomTextField(
      {Key? key, required this.controller, required this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0.6, fontFamily: 'NotoSansThai'),
        errorText: widget.validator,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(6),
        filled: true,
        fillColor: quaternaryColor,
      ),
      controller: widget.controller,
      style: TextStyle(fontFamily: 'NotoSansThai'),
    );
  }
}
