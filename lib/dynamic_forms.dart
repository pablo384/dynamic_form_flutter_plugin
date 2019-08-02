import 'dart:async';

// import 'package:dynamic_forms/question_base.dart';
import 'package:flutter/services.dart';
export './question_base.dart';
export './text_box_question.dart';
export './widgets/question_form.dart';
export './widgets/dynamic_form.dart';

class DynamicForms {
  static const MethodChannel _channel =
      const MethodChannel('dynamic_forms');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
