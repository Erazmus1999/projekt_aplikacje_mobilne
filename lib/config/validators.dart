class Validators {
  static String? notEmpty(String? text) {
    if (text != null && text.isNotEmpty) {
      return null;
    } else {
      return "Field shouldn't be empty";
    }
  }
}
