library alarm_clock;

import 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';

export 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';

class AlarmClock {
  /// Static method to create Alarm with the option to show the Alarm App
  /// the platform
  static Future<void> createAlarm({
    required int hour,
    required int minutes,
    String? title,
    bool? showAlarmApp,
  }) async {
    await AlarmClockPlatform.createAlarm(
      hour: hour,
      minutes: minutes,
      title: title,
      showAlarmApp: showAlarmApp,
    );
  }

  /// Create a timer with the option to show the Alarm App
  /// for the platform
  static Future<void> createTimer({
    required int duration,
    String? title,
    bool? showAlarmApp,
  }) async {
    await AlarmClockPlatform.createTimer(
      duration: duration,
      title: title,
      showAlarmApp: showAlarmApp,
    );
  }
}
