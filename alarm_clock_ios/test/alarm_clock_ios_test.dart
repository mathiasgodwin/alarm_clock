import 'package:flutter_test/flutter_test.dart';
import 'package:alarm_clock_ios/alarm_clock_ios.dart';
import 'package:alarm_clock_ios/alarm_clock_ios_platform_interface.dart';
import 'package:alarm_clock_ios/alarm_clock_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAlarmClockIosPlatform
    with MockPlatformInterfaceMixin
    implements AlarmClockIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AlarmClockIosPlatform initialPlatform = AlarmClockIosPlatform.instance;

  test('$MethodChannelAlarmClockIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAlarmClockIos>());
  });

  test('getPlatformVersion', () async {
    AlarmClockIos alarmClockIosPlugin = AlarmClockIos();
    MockAlarmClockIosPlatform fakePlatform = MockAlarmClockIosPlatform();
    AlarmClockIosPlatform.instance = fakePlatform;

    expect(await alarmClockIosPlugin.getPlatformVersion(), '42');
  });
}
