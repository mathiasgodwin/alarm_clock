
import 'alarm_clock_android_platform_interface.dart';

class AlarmClockAndroid {
  Future<String?> getPlatformVersion() {
    return AlarmClockAndroidPlatform.instance.getPlatformVersion();
  }
}
