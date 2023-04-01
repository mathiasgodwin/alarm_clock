import 'package:flutter_test/flutter_test.dart';
import 'package:alarm_clock_android/alarm_clock_android.dart';
import 'package:alarm_clock_android/alarm_clock_android_platform_interface.dart';
import 'package:alarm_clock_android/alarm_clock_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAlarmClockAndroidPlatform
    with MockPlatformInterfaceMixin
    implements AlarmClockAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AlarmClockAndroidPlatform initialPlatform = AlarmClockAndroidPlatform.instance;

  test('$MethodChannelAlarmClockAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAlarmClockAndroid>());
  });

  test('getPlatformVersion', () async {
    AlarmClockAndroid alarmClockAndroidPlugin = AlarmClockAndroid();
    MockAlarmClockAndroidPlatform fakePlatform = MockAlarmClockAndroidPlatform();
    AlarmClockAndroidPlatform.instance = fakePlatform;

    expect(await alarmClockAndroidPlugin.getPlatformVersion(), '42');
  });
}
