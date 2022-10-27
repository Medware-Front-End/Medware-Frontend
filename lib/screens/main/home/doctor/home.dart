import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: secondaryColor,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     systemNavigationBarColor: Colors.transparent,
      //   ),
      // ),
      body: Center(
        child: Text('This is Doctor Home Screen'),
      ),
    );
  }
}
