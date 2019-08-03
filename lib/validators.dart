class Validators {
  static isRequired(String val) {
    if (val.trim().length>0 && val.isNotEmpty) {
      return null;
    }else {
      return 'invalid';
    }
  }
}