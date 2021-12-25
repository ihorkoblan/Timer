import 'package:flutter/material.dart';

class ButtonsWidget extends StatefulWidget {
  ButtonsWidget({
    Key? key,
    required this.startButtonEnabled,
    required this.pauseButtonEnabled,
    required this.stopButtonEnabled,
    this.onStartAction,
    this.onPauseAction,
    this.onStopAction,
  }) : super(key: key);

  bool startButtonEnabled = false;
  bool pauseButtonEnabled = false;
  bool stopButtonEnabled = false;

  void Function()? onStartAction;
  void Function()? onPauseAction;
  void Function()? onStopAction;

  @override
  _ButtonsWidgetState createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: IconButton(
              onPressed: widget.startButtonEnabled == true ? widget.onStartAction : null,
              icon: const Icon(Icons.play_arrow),

            )),
        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: widget.pauseButtonEnabled == true ? widget.onPauseAction : null,
              icon: const Icon(Icons.pause),
            )),
        Expanded(
            flex: 2,
            child: IconButton(

              onPressed: widget.stopButtonEnabled == true ? widget.onStopAction : null,
              icon: const Icon(Icons.stop),
            )),
      ],
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  bool saveButtonEnabled = false;
  void Function()? onSaveAction;
  SaveButtonWidget({Key? key,
  required this.saveButtonEnabled,
     this.onSaveAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleSaveButton = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
    );
    return  ElevatedButton(
      onPressed: saveButtonEnabled == true ? onSaveAction : null,
           child: Text('Save'),
      style: styleSaveButton,
    );
  }
}
