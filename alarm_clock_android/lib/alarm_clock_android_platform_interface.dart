import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alarm_clock_android_method_channel.dart';

abstract class AlarmClockAndroidPlatform extends PlatformInterface {
  /// Constructs a AlarmClockAndroidPlatform.
  AlarmClockAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlarmClockAndroidPlatform _instance = MethodChannelAlarmClockAndroid();

  /// The default instance of [AlarmClockAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlarmClockAndroid].
  static AlarmClockAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlarmClockAndroidPlatform] when
  /// they register themselves.
  static set instance(AlarmClockAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
