import 'package:flutter/material.dart';
import 'package:alarm_clock_android/alarm_clock_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _alarmClockAndroidPlugin = AlarmClockAndroid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Container());
  }
}
