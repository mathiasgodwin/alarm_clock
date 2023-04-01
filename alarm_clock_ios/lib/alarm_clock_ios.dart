
import 'alarm_clock_ios_platform_interface.dart';

class AlarmClockIos {
  Future<String?> getPlatformVersion() {
    return AlarmClockIosPlatform.instance.getPlatformVersion();
  }
}
