import 'package:flutter/cupertino.dart';

class CellWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const CellWidget({
    Key? key,
    required this.fontSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
