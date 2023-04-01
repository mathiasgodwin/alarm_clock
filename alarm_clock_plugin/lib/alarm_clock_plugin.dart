
import 'alarm_clock_plugin_platform_interface.dart';

class AlarmClockPlugin {
  Future<String?> getPlatformVersion() {
    return AlarmClockPluginPlatform.instance.getPlatformVersion();
  }
}
