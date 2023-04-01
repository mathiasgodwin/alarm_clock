import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alarm_clock_ios_platform_interface.dart';

/// An implementation of [AlarmClockIosPlatform] that uses method channels.
class MethodChannelAlarmClockIos extends AlarmClockIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('alarm_clock_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
