import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class FormGroup extends ChangeNotifier {
  Map<String, dynamic> group = {};
  BehaviorSubject<Map<String, dynamic>> groupObs =
      BehaviorSubject<Map<String, dynamic>>();
  FormGroup();
  setValue(String key, dynamic val) {
    this.group[key] = val;
    groupObs.add(this.group);
    notifyListeners();
    print(this.group.toString());
  }

  @override
  void dispose() {
    groupObs.close();
    super.dispose();
  }
}
