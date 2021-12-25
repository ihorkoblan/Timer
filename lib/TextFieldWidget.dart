import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
// class TextFieldWidget extends StatelessWidget {
//   TextFieldWidget({
//     required this.hour,
//     required this.min,
//     required this.sec,
//     Key? key,
//   }) : super(key: key);
//
//   int hour;
//   int min;
//   int sec;
//   final TextEditingController secTextFieldController = TextEditingController();
//   final TextEditingController minTextFieldController = TextEditingController();
//   final TextEditingController hourTextFieldController = TextEditingController();
//
//   final textStyle = const TextStyle(
//     fontSize: 40,
//     color: Colors.black,
//   );
//   final decorFild = InputDecoration(
//     //filled: true,
//     border: const OutlineInputBorder(),
//     disabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey,
//         width: 3,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.circular(5),
//     ),
//     enabled: false,
//   );
//   final ButtonStyle styleSaveButton = ElevatedButton.styleFrom(
//     textStyle: const TextStyle(fontSize: 25),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           width: 70,
//           height: 80,
//           child: TextField(
//             controller: hourTextFieldController,
//             textAlign: TextAlign.center,
//             decoration: decorFild,
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 10,
//           height: 80,
//           child: Text(
//             ':',
//             style: textStyle,
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 70,
//           height: 80,
//           child: TextField(
//             controller: minTextFieldController,
//             textAlign: TextAlign.center,
//             decoration: decorFild,
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 10,
//           height: 80,
//           child: Text(
//             ':',
//             style: textStyle,
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 70,
//           height: 80,
//           child: TextField(
//             controller: secTextFieldController,
//             textAlign: TextAlign.center,
//             decoration: decorFild,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    required this.hour,
    required this.min,
    required this.sec,
    Key? key,
  }) : super(key: key);

  int hour;
  int min;
  int sec;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController secTextFieldController = TextEditingController();
  final TextEditingController minTextFieldController = TextEditingController();
  final TextEditingController hourTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    secTextFieldController.text = widget.sec.toString().padLeft(2, '0');
    minTextFieldController.text = widget.min.toString().padLeft(2, '0');
    hourTextFieldController.text = widget.hour.toString().padLeft(2, '0');

    final textStyle = const TextStyle(
      fontSize: 40,
      color: Colors.black,
    );
    final decorFild = InputDecoration(
      //filled: true,
      border: const OutlineInputBorder(),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      enabled: false,
    );
    final ButtonStyle styleSaveButton = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 70,
          height: 80,
          child: TextField(
            controller: hourTextFieldController,
            textAlign: TextAlign.center,
            decoration: decorFild,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 10,
          height: 80,
          child: Text(
            ':',
            style: textStyle,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 70,
          height: 80,
          child: TextField(
            controller: minTextFieldController,
            textAlign: TextAlign.center,
            decoration: decorFild,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 10,
          height: 80,
          child: Text(
            ':',
            style: textStyle,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 70,
          height: 80,
          child: TextField(
            controller: secTextFieldController,
            textAlign: TextAlign.center,
            decoration: decorFild,
          ),
        ),
      ],
    );
  }
}
