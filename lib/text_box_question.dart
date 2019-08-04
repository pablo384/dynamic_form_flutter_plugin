import 'package:dynamic_forms_comunity/question_base.dart';

class TextboxQuestion extends QuestionBase {
  final controlType = 'textbox';
  TextboxQuestion({Map<String, dynamic> options = const {}})
      : super(options: options);
}

class CheckBoxQuestion extends QuestionBase {
  final controlType = 'checkbox';
  CheckBoxQuestion({Map<String, dynamic> options = const {"value": false}})
      : super(options: options);
}

class DropdownQuestion extends QuestionBase {
  final controlType = 'dropdown';
  DropdownQuestion({Map<String, dynamic> options = const {}})
      : super(options: options) {
    this.options = options['options'] ?? [];
  }
}
