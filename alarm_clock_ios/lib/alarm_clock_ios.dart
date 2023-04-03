import 'package:alarm_clock_platform_interface/alarm_clock_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AlarmClockIos extends AlarmClockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const methodChannel = MethodChannel('com.mathiasgodwin.ios');

  static void registerWith() {
    AlarmClockPlatform.instance = AlarmClockIos();
  }

  static Future<void> createAlarm({
    required int hour,
    required int minutes,
    String? title,
    bool? showAlarmApp,
  }) async {
    throw UnsupportedError(
        'createAlarm() method not yet supported for this platform');
  }

  static Future<void> createTimer({
    required int duration,
    String? title,
    bool? showAlarmApp,
  }) async {
    throw UnsupportedError(
        'createTimer() method not yet supported for this platform');
  }
}
