import 'package:dynamic_forms/text_box_question.dart';
import 'package:flutter/material.dart';
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
  bool valbool = false;
  dynamic valOthers;
  @override
  void initState() {
    super.initState();
    if (question is TextboxQuestion) {
      _edit = TextEditingController(text: question.value);
      _focusNode = FocusNode();
      _edit.addListener(() {
        formGroup.setValue(question.key, _edit.text);
      });
    } else if (question is DropdownQuestion) {
      setState(() {
        valOthers = question.value == null
            ? question.options[0]['value']
            : question.value;
        print('OTHER::' + valOthers.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var reb = RebuildManager();
    if (!question.show) {
      return SizedBox(
        key: Key(question.key),
      );
    }
    if (question is TextboxQuestion) {
      return TextFormField(
        key: Key(question.key),
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

    if (question is CheckBoxQuestion) {
      print(question.toString());
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            key: Key(question.key),
            value: valbool,
            onChanged: (val) {
              print('newval:' + val.toString());
              formGroup.setValue(question.key, val);
              setState(() {
                valbool = val;
              });
            },
          ),
          Text(question.label),
        ],
      );
    }

    if (question is DropdownQuestion && question.options.length > 1) {
      return DropdownButton<dynamic>(
        value: valOthers ?? question.options[0]['value'],
        onChanged: (value) {
          formGroup.setValue(question.key, value);
          setState(() {
            valOthers = value;
          });
        },
        key: Key(question.key),
        items: [
          ...question.options.map<DropdownMenuItem>((val) {
            return DropdownMenuItem<dynamic>(
              value: val['value'] ?? 9,
              child: Text(val['label']),
            );
          }).toList()
        ],
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
