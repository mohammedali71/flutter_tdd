class TextfieldValidation {
  bool checkTextField(String textToCheck, String type) {
    bool tfCheck = false;
    if (textToCheck.isNotEmpty) {
      if (type == "email") {
        tfCheck = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(textToCheck);
      }
    } else {
      tfCheck = false;
    }
    return tfCheck;
  }
}