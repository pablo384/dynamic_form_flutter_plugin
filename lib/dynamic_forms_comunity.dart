import 'package:flutter/services.dart';
export './question_base.dart';
export './validators.dart';
export './text_box_question.dart';
export './widgets/question_form.dart';
export './widgets/dynamic_form.dart';

class DynamicFormsComunity {
  static const MethodChannel _channel =
      const MethodChannel('dynamic_forms_comunity');
}
