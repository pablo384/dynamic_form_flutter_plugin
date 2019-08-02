import 'dart:async';
import 'dart:convert';

import 'package:dynamic_forms/widgets/question_form.dart';
import 'package:flutter/material.dart';

import '../form_group.dart';
import '../question_base.dart';

class DynamicForm extends StatefulWidget {
  final List<QuestionBase> questions;
  final ValueChanged<Map<String, dynamic>> onChange;
  final ValueChanged<String> onSubmit;
  DynamicForm(
      {Key key,
      @required this.questions,
      @required this.onSubmit,
      this.onChange})
      : super(key: key);

  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  StreamSubscription changes;
  FormGroup form = FormGroup();
  ValueChanged<Map<String, dynamic>> get onChange => this.widget.onChange;

  ValueChanged<String> get onSubmit => this.widget.onSubmit;
  List<QuestionBase> get questions => this.widget.questions;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...questions.map((item) {
                return QuestionForm(
                  question: item,
                  formGroup: form,
                );
              }).toList(),
              RaisedButton(
                onPressed: () {
                  onSubmit(jsonEncode(this.form.groupObs.value));
                },
                child: Text('SAVE'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    changes.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    changes = form.groupObs.listen(onChange);
  }
}
