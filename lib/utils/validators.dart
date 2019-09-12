class Validators{
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final RegExp _nameRegExp = RegExp(
    r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
  );

  static final RegExp _telRegExp = RegExp(
    r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]{8,}"
  );


  static bool isEmailValid(String email){
    return _emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password){
    return _passwordRegExp.hasMatch(password);
  }

  static bool isNameValid(String name){
    return _nameRegExp.hasMatch(name);
  }

  static bool isTelValid(String tel){
    return _telRegExp.hasMatch(tel);
  }
}