import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alarm_clock_platform_interface.dart';

/// An implementation of [AlarmClockPlatform] that uses method channels.
class MethodChannelAlarmClock extends AlarmClockPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('alarm_clock');

}
