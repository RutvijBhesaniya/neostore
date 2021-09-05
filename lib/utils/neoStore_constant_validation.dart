class NeoStoreConstantValidation {
  ///validation of password
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some value';
    } else if (value.length < 8) {
      return 'Please enter value above 8';
    }
  }

  ///validation of user name
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some Value';
    }
  }

  ///validation of password
  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp? regex = new RegExp(pattern);
    if (!(regex.hasMatch(value!))) return "Please Enter Email";
  }

  ///validation of phone number
  String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some Value';
    } else if (value.length < 10) {
      return 'Please enter value above 10';
    }
  }
}
