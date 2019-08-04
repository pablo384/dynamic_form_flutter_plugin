import 'package:flutter/foundation.dart';

class RebuildManager extends ChangeNotifier {
  String errmsg;
  setMsg(String val) {
    this.errmsg = val;
    notifyListeners();
  }
}
