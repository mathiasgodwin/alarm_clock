import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alarm_clock_ios_method_channel.dart';

abstract class AlarmClockIosPlatform extends PlatformInterface {
  /// Constructs a AlarmClockIosPlatform.
  AlarmClockIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlarmClockIosPlatform _instance = MethodChannelAlarmClockIos();

  /// The default instance of [AlarmClockIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlarmClockIos].
  static AlarmClockIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlarmClockIosPlatform] when
  /// they register themselves.
  static set instance(AlarmClockIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
