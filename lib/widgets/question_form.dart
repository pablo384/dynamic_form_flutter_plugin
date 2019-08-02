import 'package:flutter/material.dart';

import '../form_group.dart';
import '../question_base.dart';

class QuestionForm extends StatefulWidget {
  final QuestionBase question;
  final FormGroup formGroup;
  QuestionForm({Key key, @required this.question, @required this.formGroup})
      : super(key: key);

  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  QuestionBase get question => this.widget.question;
  FormGroup get formGroup => this.widget.formGroup;
  @override
  Widget build(BuildContext context) {
    if (question.controlType == 'textbox') {
      return FormField(
        initialValue: question.value,
        builder: (state) {
          return TextField(
            onChanged: (val) {
              formGroup.setValue(question.key, val);
            },
            keyboardType: question.type == "number"
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(labelText: question.label),
          );
        },
      );
    }
    return Container(
      child: Text('data'),
    );
  }
}
