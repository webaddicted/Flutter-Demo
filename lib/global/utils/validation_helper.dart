class ValidationHelper {

  static String empty(String value, String msg) {
    if (value.length == 0) {
      return msg;
    }
    return null;
  }
  static String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    RegExp upperCasePatten = RegExp("[A-Z]");
    RegExp lowerCasePatten = RegExp("[a-z]");
    RegExp digitCasePatten = RegExp("[0-9]");
    RegExp specialCasePatten = RegExp("[!@#\$&*~]");
    if (value.length == 0) {
      return "Password is Required";
    } else if (!upperCasePatten.hasMatch(value)) {
      return 'Password must have atleast one uppercase character';
    } else if (!lowerCasePatten.hasMatch(value)) {
      return 'Password must have atleast one lowercase character';
    } else if (!digitCasePatten.hasMatch(value)) {
      return 'Password must have atleast one digit character';
    } else if (!specialCasePatten.hasMatch(value)) {
      return 'Password must have atleast one special character';
    } else if (value.length < 8) {
      return "Password must grater then 8 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Password";
    } else {
      return null;
    }
  }
  static String validateOtp(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "OTP is Required";
    } else if (value.length != 6) {
      return "OTP must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "OTP must be digits";
    }
    return null;
  }
}
