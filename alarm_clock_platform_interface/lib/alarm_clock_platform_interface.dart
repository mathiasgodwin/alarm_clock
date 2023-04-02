import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alarm_clock_method_channel.dart';

abstract class AlarmClockPlatform extends PlatformInterface {
  /// Constructs a AlarmClockPlatform.
  AlarmClockPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlarmClockPlatform _instance = MethodChannelAlarmClock();

  /// The default instance of [AlarmClockPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlarmClock].
  static AlarmClockPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlarmClockPlatform] when
  /// they register themselves.
  static set instance(AlarmClockPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static Future<void> createAlarm({
    required int hour,
    required int minutes,
    String? title,
    bool? showAlarmApp,
  }) async {
    throw UnimplementedError('setAlarm() not implemented');
  }

  static Future<void> createTimer({
    required int duration,
    String? title,
    bool? showAlarmApp,
  }) async {
    throw UnimplementedError('createTimer() not implemented');
  }
}
