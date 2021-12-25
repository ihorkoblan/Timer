// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:test/TimerModel.dart';
import 'package:test/TimerService.dart';
import 'package:test/TimerStatus.dart';

import 'TextFieldWidget.dart';
import 'buttons_widget.dart';
import 'list_view_widget.dart';

class ListWidgetHomePage extends StatefulWidget {
  @override
  _ListWidgetHomePageState createState() => _ListWidgetHomePageState();
}

class _ListWidgetHomePageState extends State<ListWidgetHomePage> {
  TimerService _timerService = TimerServiceImp();

  final List<String> _timerData = [];

  @override
  void initState() {
    super.initState();

    _timerService.onTimerUpdate = () {
      setState(() {});
    };
  }

  void _startTimer() {
    _timerService.start();
  }

  void _pause() {
    _timerService.pause();
  }

  void _reset() {
    _timerService.stop();
  }

  void _addTime() {
    TimerModel model = _timerService.getTimerValues();
    String _h = model.hours.toString().padLeft(2, '0');
    String _m = model.minutes.toString().padLeft(2, '0');
    String _s = model.seconds.toString().padLeft(2, '0');
    String saveTime = "$_h : $_m : $_s";

    setState(() {
      // _timerData.add(saveTime); //додає один елемент, переданий як аргумент, до кінця списку.
      _timerData.insert(0,
          saveTime); //додає один елемент до списку за заданим індексом, а потім переміщує кожен елемент на 1, щоб звільнити місце
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Тестування')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),

                TextFieldWidget(
                  sec: _timerService.getTimerValues().seconds,
                  min: _timerService.getTimerValues().minutes,
                  hour: _timerService.getTimerValues().hours,
                ),
                SizedBox(width: 25),
                ButtonsWidget(
                  startButtonEnabled: _timerService.getTimerStatus() != TimerStatus.working,
                  pauseButtonEnabled: _timerService.getTimerStatus() != TimerStatus.paused,
                  stopButtonEnabled: true,
                  onStartAction: () {
                    _startTimer();
                  },
                  onPauseAction: () {
                    _pause();
                  },
                  onStopAction: () {
                    _reset();
                  },
                ),
                SizedBox(width: 25),
                SaveButtonWidget(
                  saveButtonEnabled: (_timerService.getTimerStatus() == TimerStatus.working) ||
                      (_timerService.getTimerStatus() == TimerStatus.paused),
                  onSaveAction: () {
                    _addTime();
                  },
                ),

                // ElevatedButton( //startButtonAvailable? _startTimer : null,
                //   onPressed: _mode != TimerMode.on ? _addTime : null,
                //   child: Text('Save'),
                //   style: styleSaveButton,
                // ),
              ],
            ),
          ),
          Flexible(
            child: ListViewWidget(
              items: _timerData,
            ),
          ),
        ],
      ),
    );
  }
}
