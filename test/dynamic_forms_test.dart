import 'package:dynamic_forms/text_box_question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

void main() {
  // const MethodChannel channel = MethodChannel('dynamic_forms');

  // setUp(() {
  //   channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //     return '42';
  //   });
  // });

  // tearDown(() {
  //   channel.setMockMethodCallHandler(null);
  // });

  // test('getPlatformVersion', () async {
  //   expect(await DynamicForms.platformVersion, '42');
  // });
  test('question', () async {
    QuestionBase avd = TextboxQuestion(options: {"type": "nufasdfmber"});
    print(avd.toString());
    expect(avd.value, '');
  });
}
