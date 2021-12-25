import 'dart:async';

import 'package:test/TimerModel.dart';
import 'package:test/TimerStatus.dart';

abstract class TimerService {
  void start();
  void stop();
  void pause();

  TimerModel getTimerValues();
  TimerStatus getTimerStatus();

  Function()? onTimerUpdate; // замінити на timerStream

  // late Stream<TimerModel> timerStream;
}

class TimerServiceImp extends TimerService {
  TimerService() {}

  TimerStatus _status = TimerStatus.idle;
  Timer? _timer;
  TimerModel _model = TimerModel(0, 0, 0);

  // StreamController<TimerModel> _streamController = StreamController<TimerModel>();

  // @override
  // Stream<TimerModel> get timerStream => _streamController.stream;

  @override
  void pause() {
    _status = TimerStatus.paused;
    _resetTimer();
    onTimerUpdate!();
  }

  @override
  void start() {
    onTimerUpdate!();

    _status = TimerStatus.working;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _model.seconds++;

      if (_model.seconds > 59) {
        _model.minutes += 1;
        _model.seconds = 0;
        if (_model.minutes > 59) {
          _model.hours += 1;
          _model.minutes = 0;
        }
      }

      onTimerUpdate!();
    });
  }

  @override
  void stop() {
    _status = TimerStatus.stopped;
    _resetTimer();
    _resetTimerModel();
    onTimerUpdate!();
  }

  @override
  TimerModel getTimerValues() {
    return _model;
  }

  @override
  TimerStatus getTimerStatus() {
    return _status;
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _resetTimerModel() {
    _model.hours = 0;
    _model.minutes = 0;
    _model.seconds = 0;
  }
}
