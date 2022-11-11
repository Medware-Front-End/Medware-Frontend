import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/components/action_button.dart';
import 'package:medware/screens/main/profile/edit_profile/components/input_field.dart';
import 'package:medware/screens/main/profile/edit_profile/components/list_display.dart';
import 'package:medware/utils/colors.dart';

class EditMedicalDetails extends StatefulWidget {
  final String title;
  final List<String> details;
  const EditMedicalDetails({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  State<EditMedicalDetails> createState() => _EditMedicalDetailsState();
}

class _EditMedicalDetailsState extends State<EditMedicalDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inputController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('แก้ไขข้อมูล${widget.title}'),
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'NotoSansThai',
          fontWeight: FontWeight.w700,
          fontSize: size.width * 0.06,
          color: primaryColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          children: [
            InputField(
              label: 'เพิ่มข้อมูล${widget.title}ของคุณ',
              placeholder: 'กรอกข้อมูล${widget.title}ของคุณ',
              error: '',
              isNextable: false,
              controller: inputController,
              suffix: IconButton(
                splashRadius: 1,
                onPressed: () => setState(
                  () => widget.details.add(inputController.text),
                ),
                icon: Icon(
                  Icons.add,
                  color: primaryColor,
                ),
              ),
            ),
            ListDisplay(list: widget.details),
          ],
        ),
      ),
    );
  }
}
