import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medware/utils/colors.dart';
import 'package:medware/utils/shared_preference/shared_preference.dart';

class SelectablePic extends StatelessWidget {
  final String path;
  final Future<void> Function() refresh;

  const SelectablePic({
    Key? key,
    required this.path,
    required this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        showDialog(
          context: context,
          builder: (context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'เลือกรูปโปรไฟล์ใหม่',
                    style: TextStyle(
                      color: quaternaryColor,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.075,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * 0.075,
                      mainAxisSpacing: size.width * 0.075,
                    ),
                    itemCount: SharedPreference.profilePictures.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () async {
                        await refresh;
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        SharedPreference.profilePictures[i],
                        height: size.height * 0.15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Image.asset(
        path,
        height: size.height * 0.2,
      ),
    );
  }
}
