import 'package:dynamic_forms/question_base.dart';

class TextboxQuestion extends QuestionBase {
  final controlType = 'textbox';
  TextboxQuestion({Map<String, dynamic> options = const {}}) : super(options: options);
}
