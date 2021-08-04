class NeoStoreConstantValidation {
  ///validation of password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter some value';
    } else if (value.length < 8) {
      return 'Please Enter value above 8';
    }
  }

  ///validation of user name
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please Enter Some Value';
    }
  }
}
