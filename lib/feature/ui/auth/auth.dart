var _username = ['Andhika'];
var _email = ['flutter@alta.com'];
var _password = ["flutter123"];

class Authentication {
  bool fetchCredentials(String username, String password, String email) {
    for (var j = 0; j < _username.length; j++) {
      if (username == _username[j] &&
          password == _password[j] &&
          email == _email[j]) {
        return true;
      }
    }
    return false;
  }
}
