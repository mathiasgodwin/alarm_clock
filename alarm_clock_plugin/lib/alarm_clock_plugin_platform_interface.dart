import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alarm_clock_plugin_method_channel.dart';

abstract class AlarmClockPluginPlatform extends PlatformInterface {
  /// Constructs a AlarmClockPluginPlatform.
  AlarmClockPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlarmClockPluginPlatform _instance = MethodChannelAlarmClockPlugin();

  /// The default instance of [AlarmClockPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlarmClockPlugin].
  static AlarmClockPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlarmClockPluginPlatform] when
  /// they register themselves.
  static set instance(AlarmClockPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
