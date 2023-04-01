import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alarm_clock_ios/alarm_clock_ios_method_channel.dart';

void main() {
  MethodChannelAlarmClockIos platform = MethodChannelAlarmClockIos();
  const MethodChannel channel = MethodChannel('alarm_clock_ios');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
