class Validator {
  // email validation function
  String? emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email tidak boleh kosong";
    } else if (value.length < 6) {
      return "Email harus lebih dari 6 angka";
    } else if (!regExp.hasMatch(value)) {
      return "Ketik email yang benar";
    }
    return null;
  }

  // password validation function
  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (value.length < 6) {
      return "Password harus lebih dari 6 huruf";
    }
    return null;
  }

  // password validation function
  String? usernameValidator(String? value) {
    if (value!.isEmpty) {
      return "Nama Lengkap tidak boleh kosong";
    } else if (value.length < 5) {
      return "Nama Lengkap harus lebih dari 5 huruf";
    }
    return null;
  }

  // password validation function
  String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Nomor Telepon tidak boleh kosong";
    } else if (value.length < 12) {
      return "Nomor Telepon lebih dari atau 12 huruf";
    }
    return null;
  }

  String? passwordConfirmValidator(String value, String passwordValue) {
    if (value.isEmpty) {
      return "Konfirmasi password anda";
    } else if (value != passwordValue) {
      return "Password tidak cocok";
    }
    return null;
  }
}
