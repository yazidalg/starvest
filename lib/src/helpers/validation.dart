class Validator {
  // email validation function
  String? emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!)) {
      return "Ketik email yang benar";
    } else if (value.length < 6) {
      return "Email harus lebih dari 6 angka";
    } else if (value.isEmpty) {
      return "Email tidak boleh kosong";
    } else {
      return null;
    }
  }

  // password validation function
  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (value.length < 6) {
      return "Password harus lebih dari 6 huruf";
    } else {
      return null;
    }
  }

  // password validation function
  String? usernameValidator(String? value) {
    if (value!.isEmpty) {
      return "Nama Lengkap tidak boleh kosong";
    } else if (value.length < 5) {
      return "Nama Lengkap harus lebih dari 5 huruf";
    } else {
      return null;
    }
  }

  // password validation function
  String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Nomor Telepon tidak boleh kosong";
    } else if (value.length < 12) {
      return "Nomor Telepon lebih dari atau 12 huruf";
    } else {
      return null;
    }
  }
}
