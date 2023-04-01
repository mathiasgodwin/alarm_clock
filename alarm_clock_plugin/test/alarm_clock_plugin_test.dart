import 'package:flutter_test/flutter_test.dart';
import 'package:alarm_clock_plugin/alarm_clock_plugin.dart';
import 'package:alarm_clock_plugin/alarm_clock_plugin_platform_interface.dart';
import 'package:alarm_clock_plugin/alarm_clock_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAlarmClockPluginPlatform
    with MockPlatformInterfaceMixin
    implements AlarmClockPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AlarmClockPluginPlatform initialPlatform = AlarmClockPluginPlatform.instance;

  test('$MethodChannelAlarmClockPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAlarmClockPlugin>());
  });

  test('getPlatformVersion', () async {
    AlarmClockPlugin alarmClockPlugin = AlarmClockPlugin();
    MockAlarmClockPluginPlatform fakePlatform = MockAlarmClockPluginPlatform();
    AlarmClockPluginPlatform.instance = fakePlatform;

    expect(await alarmClockPlugin.getPlatformVersion(), '42');
  });
}
