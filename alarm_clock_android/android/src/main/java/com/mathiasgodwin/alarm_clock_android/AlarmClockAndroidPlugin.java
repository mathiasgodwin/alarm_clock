package com.mathiasgodwin.alarm_clock_android;

import androidx.annotation.NonNull;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.provider.AlarmClock;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** AlarmClockAndroidPlugin */
public class AlarmClockAndroidPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "com.mathiasgodwin.android");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    try {
      arguments = call.arguments;

      if (call.method.equals("createAlarm")) {
        final int hour = (int) arguments("hour");
        final int minutes = (int) call.arguments("minutes");
        final String title = (String) call.arguments("title");
        final boolean showAlarmApp = (boolean) call.arguments("showAlarmApp");
        createAlarm(hour, minutes, title, showAlarmApp);

      } else if (call.method.equals("createTimer")) {
        final int duration = (int) call.arguments("duration");
        final String title = (String) call.arguments("title");
        final boolean showAlarmApp = (boolean) call.arguments("showAlarmApp");
        createTimer(duration, title, showAlarmApp);

      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    this.activity = null;
  }

  private void createAlarm(int hour, int minutes, String title, boolean showAlarmApp) {
    final Intent intent = Intent(AlarmClock.ACTION_SET_ALARM);
    intent.putExtra(AlarmClock.EXTRA_HOUR, hour);
    intent.putExtra(AlarmClock.EXTRA_MINUTES, minutes);
    intent.putExtra(AlarmClock.EXTRA_MESSAGE, title);
    intent.putExtra(AlarmClock.EXTRA_SKIP_UI, showAlarmApp);

    try {
      activity.startActivity(intent);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
  }

  private void createTimer(int duration, String title, boolean showAlarmApp) {
    final Intent intent = Intent(AlarmClock.ACTION_SET_TIMER);
    intent.putExtra(AlarmClock.EXTRA_LENGTH, duration);
    intent.putExtra(AlarmClock.EXTRA_MESSAGE, title);
    intent.putExtra(AlarmClock.EXTRA_SKIP_UI, showAlarmApp);

    try {
      activity.startActivity(intent);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
  }
}
