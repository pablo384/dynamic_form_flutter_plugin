import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
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
            TextboxQuestion avd = TextboxQuestion(
                options: {"type": "password", "label": "labeel", "key": "uno", "show": true});
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
            return DynamicForm(
              questions: lista,
              onSubmit: (val) {
                print('ENVIADO::$val');
              },
              onChange: (val) {
                print('cambio ${val.toString()}');
              },
            );

            // return Column(
            //   children: <Widget>[
            //     QuestionForm(
            //       question: avd,
            //     ),
            //     QuestionForm(
            //       question: text,
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
