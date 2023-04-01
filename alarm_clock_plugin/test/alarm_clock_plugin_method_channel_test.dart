import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alarm_clock_plugin/alarm_clock_plugin_method_channel.dart';

void main() {
  MethodChannelAlarmClockPlugin platform = MethodChannelAlarmClockPlugin();
  const MethodChannel channel = MethodChannel('alarm_clock_plugin');

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
