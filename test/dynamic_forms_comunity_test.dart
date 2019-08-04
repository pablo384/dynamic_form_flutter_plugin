import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_forms_comunity/dynamic_forms_comunity.dart';

void main() {
  const MethodChannel channel = MethodChannel('dynamic_forms_comunity');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  test('question', () async {
    QuestionBase avd = TextboxQuestion(options: {"type": "nufasdfmber"});
    print(avd.toString());
    expect(avd.value, '');
  });
  test('getPlatformVersion', () async {
    // expect(await DynamicFormsComunity.platformVersion, '42');
  });
}
