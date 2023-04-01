import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alarm_clock_android_platform_interface.dart';

/// An implementation of [AlarmClockAndroidPlatform] that uses method channels.
class MethodChannelAlarmClockAndroid extends AlarmClockAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('alarm_clock_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
