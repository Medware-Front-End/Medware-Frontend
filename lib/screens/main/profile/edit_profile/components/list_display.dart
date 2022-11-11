import 'package:flutter/material.dart';
import 'package:medware/utils/colors.dart';

class ListDisplay extends StatefulWidget {
  final List<String> list;
  const ListDisplay({Key? key, required this.list}) : super(key: key);

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return widget.list.length > 0
        ? Container(
            width: size.width,
            height: size.height * 0.675,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.035,
              vertical: size.width * 0.01,
            ),
            decoration: BoxDecoration(
                color: quaternaryColor,
                borderRadius: BorderRadius.circular(size.width * 0.035)),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: widget.list.length,
              itemBuilder: (context, i) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.list[i],
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        setState(() => widget.list.removeAt(i));
                      },
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          )
        : Text(
            'ไม่มีข้อมูล ณ ขณะนี้',
            style: TextStyle(color: Colors.grey),
          );
  }
}
