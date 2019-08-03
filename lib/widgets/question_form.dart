import 'package:dynamic_forms/rebuild_manager.dart';
import 'package:dynamic_forms/text_box_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

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
  // String errormsg;
  BehaviorSubject<String> errormsg = BehaviorSubject<String>();
  TextEditingController _edit;
  FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    if (question is TextboxQuestion) {
      _edit = TextEditingController(text: question.value);
      _focusNode = FocusNode();
      _edit.addListener(() {
        formGroup.setValue(question.key, _edit.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var reb = RebuildManager();
    if (question.controlType == 'textbox') {
      if (!question.show) {
        return SizedBox();
      }
      return TextFormField(
        obscureText: question.type == "password",
        controller: _edit,
        keyboardType: question.type == "number"
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
          labelText: question.label,
        ),
        autovalidate: true,
        focusNode: _focusNode,
        validator: (val) {
          var res;
          if (_focusNode.hasPrimaryFocus)
            question.validators.forEach((func) {
              res = func(val);
              print('validator:v: ${res.toString()}');
            });
          return res;
        },
      );
    }
    return Container(
      child: Text('data'),
    );
  }

  @override
  void dispose() {
    errormsg.close();
    _focusNode.dispose();
    _edit.dispose();
    super.dispose();
  }
}
