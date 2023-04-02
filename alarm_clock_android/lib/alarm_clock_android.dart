import 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AlarmClockAndroid extends AlarmClockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const methodChannel = MethodChannel('com.mathiasgodwin.android');

  static void registerWith() {
    AlarmClockPlatform.instance = AlarmClockAndroid();
  }

  static Future<void> createAlarm({
    required int hour,
    required int minutes,
    String? title,
    bool? showAlarmApp,
  }) async {
    await methodChannel.invokeMethod('createAlarm', {
      'hour': hour,
      'minutes': minutes,
      'title': title,
      'showAlarmApp': showAlarmApp,
    });
  }

  static Future<void> createTimer({
    required int duration,
    String? title,
    bool? showAlarmApp,
  }) async {
    await methodChannel.invokeMethod('createTimer', {
      'duration': duration,
      'title': title,
      'showAlarmApp': showAlarmApp,
    });
  }
}
