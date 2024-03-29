import 'package:flutter/material.dart';
import 'package:dynamic_forms_comunity/dynamic_forms_comunity.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) {
            TextboxQuestion avd = TextboxQuestion(options: {
              "type": "password",
              "label": "labeel",
              "key": "uno",
              "show": true
            });
            TextboxQuestion text = TextboxQuestion(
                options: {"type": "text", "label": "labeel", "key": "dos"});
            List<QuestionBase> lista = List<QuestionBase>();
            lista.add(avd);
            lista.add(text);
            lista.add(TextboxQuestion(options: {
              "type": "text",
              "label": "klk",
              "key": "adsfds",
              "validators": [Validators.isRequired]
            }));
            lista.add(CheckBoxQuestion(options: {
              "type": "text",
              "label": "klk",
              "key": "adsfds",
              "value": false,
              "validators": [Validators.isRequired]
            }));
            lista.add(DropdownQuestion(options: {
              "type": "text",
              "label": "klk",
              "key": "qwe",
              "value": "0",
              "options": [
                {"label": "uno", "value": "0"},
                {"label": "dos", "value": "2"},
                {"label": "tres", "value": "3"},
              ],
              "validators": [Validators.isRequired]
            }));
            return DynamicForm(
              questions: lista,
              onSubmit: (val) {
                print('ENVIADO::$val');
              },
              onChange: (val) {
                print('cambio ${val.toString()}');
              },
            );
          },
        ),
      ),
    );
  }
}
