
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterZig {
  static const MethodChannel _channel = MethodChannel('flutter_zig');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
