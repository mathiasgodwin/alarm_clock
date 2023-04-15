library alarm_clock;

import 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';

export 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';

AlarmClockPlatform get _platform => AlarmClockPlatform.instance;

class AlarmClock {
  /// Static method to create Alarm with the option to show the Alarm App
  /// the platform
  Future<void> createAlarm({
    required int hour,
    required int minutes,
    String? title,
    bool? showAlarmApp,
  }) async {
    await _platform.createAlarm(
      hour: hour,
      minutes: minutes,
      title: title,
      showAlarmApp: showAlarmApp,
    );
  }

  /// Create a timer with the option to show the Alarm App
  /// for the platform
  Future<void> createTimer({
    required int duration,
    String? title,
    bool? showAlarmApp,
  }) async {
    await _platform.createTimer(
      duration: duration,
      title: title,
      showAlarmApp: showAlarmApp,
    );
  }
}
